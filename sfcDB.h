#ifndef __SFC_DB__
#define __SFC_DB__

struct MemoryStruct {
        char *memory;
        size_t size;
};

typedef struct StationInfo{
	char sti_stn[40];
	int    sti_times;
}snt;

struct MemoryStruct *mem;

extern char* queryProvInfo( const char* sn, const char* productType ); 

extern char* queryInfo( const char* sn, const char* productType, const char* param );  

extern char* queryProcessCheck( const char* sn, const char* station_name, const char* productType );   

extern char* queryStationInfo( const char* sn, const char* station_name, const char* productType );  

extern char* queryTestRecord( const char* sn, const char* productType );    

extern char* findUnitLocation( const char* sn, const char* productType );

extern char* countOfTest( const char* sn, const char* productType );

#endif
