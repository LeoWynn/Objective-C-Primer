#include <stdio.h>
#include <curl/curl.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include "sfcDB.h"
#include <assert.h>

#define SFC_IP  "http://172.25.3.167/"
#define SIZE  1024

struct StationStu{
	char StaName[128];
	int count;
	int sign;
} ;

struct StationStu ptr[SIZE];

char * tmp_buff;
size_t _writeMemoryCallback(void *contents, size_t size, size_t nmemb, void *userp)
{
	//printf("content:%s\n",contents);
	size_t realsize = size * nmemb;
	mem = (struct MemoryStruct *)userp;
	mem->memory = (char *)realloc( mem->memory, mem->size + realsize + 1 );
	//printf("mem->memory:%p\n", mem->memory);
	if(mem->memory == NULL) 
	{	
		printf("not enough memory (realloc returned NULL)\n");
		return -1;
	}
	//memset( &(mem->memory[mem->size]),0,mem->size + realsize + 1 );
	memcpy(	&(mem->memory[mem->size]), contents, realsize );
	mem->size += realsize;
	mem->memory[mem->size] = 0;
	return realsize;
}

char * _curlGetDataFromSFC( const char* q_sn, const char* q_ts, const char* q_control, const char* q_product, const char* q_param )
{	
	CURL *curl_handle;
	CURLcode res;
	struct MemoryStruct chunk = {NULL, 0};
	char data[512] = {0};
	char * url = (char *)malloc( strlen(SFC_IP)+strlen(q_product)+1 );
	strcpy( url, SFC_IP );
	strcat( url, q_product );

	strcat( data, "sn=" );
	strcat( data, q_sn );
	strcat( data, "&c=" );
	if( !strcmp(q_control,"QUERY_RECORD") ){
		strcat( data, q_control );
		if(q_ts){
			strcat( data, "&ts="); strcat( data, q_ts );
		}
	}
	else
		strcat( data, q_control );

	if( q_param )
	{
		strcat( data, "&" );
		strcat( data, q_param );
	}

	data[strlen(data)]=0;

	//printf( "get data:\n%s%s\n", url,data );

	if(curl_global_init(CURL_GLOBAL_ALL))
		fprintf( stderr,"init error\n" );

	curl_handle = curl_easy_init();	
	if(!curl_handle)
		fprintf( stderr,"init error\n" );



	curl_easy_setopt( curl_handle, CURLOPT_URL, url );
	curl_easy_setopt( curl_handle, CURLOPT_TIMEOUT, 3 );
	curl_easy_setopt( curl_handle,CURLOPT_POSTFIELDS,data );
	curl_easy_setopt( curl_handle, CURLOPT_WRITEFUNCTION, _writeMemoryCallback );
	curl_easy_setopt( curl_handle, CURLOPT_WRITEDATA, &chunk );
	curl_easy_setopt( curl_handle, CURLOPT_USERAGENT, "libcurl-agent/1.0" );

	res = curl_easy_perform(curl_handle);
	if(res != CURLE_OK) 
	{
		switch((int)res)
		{
			case CURLE_UNSUPPORTED_PROTOCOL:
				fprintf( stderr,"不支持的协议,由URL的头部指定\n" );
				break;
			case CURLE_COULDNT_CONNECT:
				fprintf( stderr,"不能连接到remote主机或者代理\n" );
				break;
			case CURLE_HTTP_RETURNED_ERROR:
				fprintf( stderr,"http返回错误\n" );
				break;
			case CURLE_READ_ERROR:
				fprintf( stderr,"返回值:%d: %s\n",res, curl_easy_strerror(res) );
				break;
		}

	}

	curl_easy_cleanup(curl_handle);
	curl_global_cleanup();
	if(url)
	{
		free(url);
		url = NULL;
	}

	tmp_buff = chunk.memory;
	/*
	   if(chunk.memory)
	   {
	   free(chunk.memory);
	   chunk.memory = NULL;
	   }
	 */
	return tmp_buff;
	/*
	   chunk.memory = strstr( chunk.memory, "SFC_OK" );
	   return (chunk.memory+7);
	 */
}

//void _curlGetDataFromSFC( const char* q_sn, const char* q_ts, const char* q_control, const char* q_product, const char* q_param )
//http://172.25.3.167/fatpPRODUCT?sn=88940AAA3NP&c=QUERY_RECORD&p=mpn&p=region_code&p=imei
char* queryProvInfo( const char* sn, const char* productType ) 
{
	//printf("enter queryProvInfo function\n");	
	return _curlGetDataFromSFC( sn, NULL, "QUERY_RECORD", productType, "p=mpn&p=region_code&p=imei" );
}

char* queryInfo( const char* sn, const char* productType, const char* param ) 
{
	//printf("enter queryIMEI function\n");	
	return _curlGetDataFromSFC( sn, NULL, "QUERY_RECORD", productType, param );
}

//http://17UERY_RECORD&ts=SW-DOWNLOAD&p=unit_process_check

char* queryProcessCheck( const char* sn, const char* station_name, const char* productType )
{
	//printf("enter queryProcessCheck function\n");	
	return _curlGetDataFromSFC( sn, station_name, "QUERY_RECORD", productType, "&p=unit_process_check" );
}


//http://172.25.3.167/fatpd11?sn=C39QM005GYTM&c=QUERY_RECORD&ts=FDR-SEAL&p=station_id&p=result&p=start_time&p=end_time
char* queryStationInfo( const char* sn, const char* station_name, const char* productType )
{
	//printf("enter queryStationInfo function\n");	
	return _curlGetDataFromSFC( sn, station_name, "QUERY_RECORD", productType, "p=station_id&p=result&p=start_time" );

}

//http://172.25.3.167/fatpd11?sn=C39QM005GYTM&c=QUERY_HISTORY
char* queryTestRecord( const char* sn, const char* productType )
{
	//printf("enter queryTestRecord function\n");	
	return _curlGetDataFromSFC( sn, NULL, "QUERY_HISTORY", productType, NULL );
}

char* findUnitLocation( const char* sn, const char* productType )
{
	char * result_temp = NULL;			
	char * sub = NULL, *brkt = NULL;
	char * sep = "\n";
	int i=0;
	char * data[1024]={0};
	result_temp = _curlGetDataFromSFC( sn, NULL, "QUERY_HISTORY", productType, NULL );
	while( (sub=strtok_r( result_temp, sep, &brkt )) != NULL)
	{
		data[i++] = sub;
		result_temp = NULL;
	}

	return data[i-1];
}

char * countOfTest( const char* sn, const char* productType )
{

  	int i=0,j=0,k=0,in=0;
	//int realsize=0;
	char * sub = NULL, *brkt = NULL;	
	char *ret;
	char *tmpstr=NULL;
	char *TmpHistory=NULL;
	//char *TmpChar[SIZE][2]={0};
	char p[SIZE]={0};
	char history[SIZE]={0};

	char *str=_curlGetDataFromSFC( sn, NULL, "QUERY_HISTORY", productType, NULL );
	tmpstr=(char *)malloc(strlen(str));
	assert(tmpstr!=NULL) ;
	strcpy(tmpstr,str) ;

	/////解析各个工站记录
	while( (sub=strtok_r(str,"\n", &brkt )) != NULL)
	{
		 if((ret=strstr(sub,"result"))!=NULL)
		 {

				if((ret=strtok(sub,":"))!=NULL)
			{
				
				if((ret=strrchr(ret,'_'))!=NULL)
				{			
					memcpy(p,ret,strlen(ret));
					memcpy(p,p+1,strlen(ret)-1);
					p[strlen(ret)-1]=0;					//p=station name
				
					strncpy(ptr[in].StaName,p,strlen(ret)-1);
					memset((void *)p,0,SIZE);
					ptr[in].StaName[strlen(ret)]=0;					
					ptr[in].count=1;
					ptr[in].sign=0;	
					in++;							
				}
			
			}
		 }

		str=NULL;
	}	
	if(in==0)
	{
		return NULL;
	}
	if(str)
	{
		free(str);
		str=NULL;
	}
	//统计各个工站测试次数
	i=0;
	while(((ptr[i].StaName)!=NULL )&&(i<in))
	{
		if(ptr[i].sign==0) 
		{
			for(j=i+1;j<in;j++)
			{			
				tmpstr=ptr[i].StaName;		
				if(strcmp(tmpstr,ptr[j].StaName)!=0)
				{
					continue;
				}
				ptr[j].sign=1;	
				ptr[i].count++;
			
			}
		}
		i++;
	}
	//输出次数
    memset((void *)p,0,SIZE);
	for(k=0;(ptr[k].StaName!=NULL)&&(k<in);k++)
	{
		if(!ptr[k].sign)
		{	

			sprintf(p,"%d\n",ptr[k].count);			
			strcat(history,ptr[k].StaName);
			strcat(history,":");	
			strcat(history,p);
    		memset((void *)p,0,SIZE);
	   }			
	}
	history[strlen(history)-1]=0;		
	TmpHistory=history;
	in=0;
	return TmpHistory;

}
