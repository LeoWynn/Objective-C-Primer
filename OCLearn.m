//
//  main.m
//  OCLearn
//
//  Created by coreos on 2/11/17.
//  Copyright (c) 2017 Leo Wen. All rights reserved.
//

#import "OCLearn.h"
#import "FKPerson.h"

void learnFKPrinter()
{
    @autoreleasepool {
        FKPrinter* printer1 = [[FKPrinter alloc]init];
        [printer1 addData:@"ios"];
        [printer1 addData:@"osx"];
        [printer1 output];
        NSLog(@"log");
        [printer1 addData:@"hello"];
        [printer1 addData:@"world"];
        [printer1 output];
        
    }
}

void learnNSNumber_category()
{
    @autoreleasepool {
        NSNumber* myNum = [NSNumber numberWithInt:3];
        
        NSNumber* add = [myNum add:2.4];
        NSLog(@"%@", add);
        
        NSNumber* substract = [myNum substract:2.4];
        NSLog(@"%@", substract);

        NSNumber* multiply = [myNum multiply:2.4];
        NSLog(@"%@", multiply);

        NSNumber* divide = [myNum divide:2.4];
        NSLog(@"%@", divide);
        

    }
}

void learnNSStringCompare()
{
    @autoreleasepool {
        NSString* str1 = [[NSString alloc]initWithFormat:@"os"];
        NSString* str2 = [[NSString alloc]initWithFormat:@"os"];
        NSLog(@"str1 isEqual str2: %d", [ str1 isEqual:str2]);  //
        NSLog(@"str1 isEqual str2: %d", (str1 == str2));
        
        NSString* str3 = @"OS"; //常量池
        NSString* str4 = @"OS";
        NSLog(@"str3 isEqual str4: %d", [ str3 isEqual:str4]);  //
        NSLog(@"str3 isEqual str4: %d", (str3 == str4));
    }
}

void learnNSNumber()    //可以把c语言中常见类型转换成nsnumber类
{
    @autoreleasepool {
//        NSNumber* num = [NSNumber numberWithInt:22];
//        NSLog(@"num: %d", [num intValue]);
//        
//        NSNumber* de = [NSNumber numberWithDouble:2.333];
            //NSLog(@"de: %g",[de doubleValue]);
    }
}

void learnIsKindTest()
{
    //判断指针变量的实际类型
    @autoreleasepool {
        NSString* obj = @"hello";
        //[obj isKindOfClass:[NSObject class]];
        NSLog(@"字符串是否是nsobject的实例：%d",[obj isKindOfClass:[NSObject class]]);
        NSLog(@"字符串是否是NSString的实例：%d",[obj isKindOfClass:[NSString class]]);
        NSLog(@"字符串是否是NSDate的实例：%d",[obj isKindOfClass:[NSDate  class]]);
        NSLog(@"字符串是否是NSData的实例：%d",[obj isKindOfClass:[NSData  class]]);
        
    }
}

void learnConversionTest()
{
    //强制类型转换，（）
    @autoreleasepool {
        NSObject* obj = @"hello";
        
        NSString* objstr = (NSString*)obj;
        NSLog(@"objstr:%@", objstr);
        
        NSObject* obj2 = @"ios";
        NSData* date = (NSData*) obj2;
        NSLog(@"date:%@", date);
        
        //
        //NSLog(@"%d", [date isEqualToData:[NSDate date]]);
    }
}

void learnFKSubBase()
{
    FKBase* base = [ [FKBase alloc]init];
    [base base];
    [base test];
    
    FKSubBase* subBase = [[FKSubBase alloc]init];
    [subBase test];
    [subBase sub];
    [subBase base];
    
    //下面编译是和运行时的类型不一致，发生多态
    FKBase* ploymophicBc = [[FKSubBase alloc]init];
    [ploymophicBc test];
    [ploymophicBc base];
    //[ploymophicBc sub];   //show error as no sub 方法
    //可将任意类型的指针赋值给id类型
//    id idtest = ploymophicBc;
//    [idtest sub];
//    //[idtest test];
//    [idtest base];
}


void learnFKAppleTest()
{
    //
    FKApple* apple = [[FKApple alloc]init];
    apple.weight = 2.22;
    [apple info];
    
}

void learnFKCar()
{
    @autoreleasepool {
        FKCar* mycar = [[FKCar alloc]init];
        NSLog(@"mycar brand: %@, mycar model:%@, mycar color:%@", mycar.brand, mycar.model, mycar.color);
        
        mycar = [mycar initWithBrand:@"法拉利" model:@"M8"];
        NSLog(@"mycar brand: %@, mycar model:%@, mycar color:%@", mycar.brand, mycar.model, mycar.color);
        
        mycar = [mycar initWithBrand:@"玛莎拉蒂" model:@"K6" color:@"红色"];
        NSLog(@"mycar brand: %@, mycar model:%@, mycar color:%@", mycar.brand, mycar.model, mycar.color);
        
    }
}

void learnFKItem()
{
    @autoreleasepool {
        FKItem* item1 = [[FKItem alloc]init];
        item1.name = @"ios";
        item1.price = 22;
        NSLog(@"item1 name: %@, item1 price: %d",item1.name,item1.price);
        
        FKItemView* itemView1 = [[FKItemView alloc]init];
        //itemView1.item = item1;
        itemView1.item = @"leo";
        [itemView1 showItemInfo];
        itemView1.item = @"leowen";
    
        
    }
}

void learnid()
{
    @autoreleasepool {
        //id 运行时动态调用的方法，而不是在编译时确定要调用的方法
        id p = [[FKPerson alloc]init];
//        [p setName:@"leo"];
//        NSLog(@"%@",[p name]);
        [p test:@"leo",@"jim",nil];
    }
}

void learnNSThread()
{
    //
    //[NSThread detachNewThreadSelector:@selector(learnNSThreadTest()) toTarget:nil withObject:nil]
}

void studyThreads6()    //同步执行+主队列（死锁）
{
    //获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"---start---");
    //使用同步函数封装三个任务
    dispatch_sync(queue, ^{
        NSLog(@"任务1---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
    });
    NSLog(@"---end---");
}


void studyThreads5()    //异步执行+主队列 (跳过，只执行主队列)
{
    //获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"---start---");
    //使用异步函数封装三个任务
    dispatch_async(queue, ^{
        NSLog(@"任务1---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务1，i= %d", i );
        }
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务2，i= %d", i );
        }
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务3，i= %d", i );
        }
    });
    NSLog(@"---end---");
}

void studyThreads4() //同步执行+ 串行队列, 只要是同步执行就不会创建新的线程，所以都是顺序执行
{
    //创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"---start---");
    //使用异步函数封装三个任务
    dispatch_sync(queue, ^{
        NSLog(@"任务1---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务1，i= %d", i );
        }
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务2，i= %d", i );
        }
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务3，i= %d", i );
        }
    });
    NSLog(@"---end---");
    
}

void studyThreads3()    //同步执行 + 并行队列
{
    //创建一个并行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"---start---");
    //使用同步函数封装三个任务
    dispatch_sync(queue, ^{
        NSLog(@"任务1---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务1，i= %d", i );
        }
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务2，i= %d", i );
        }
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务3，i= %d", i );
        }
    });
    NSLog(@"---end---");
    
}
void studyThreads2()    //同步执行 + 串行队列
{
    //创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"---start---");
    for (int i = 0; i<10000; i++) {
        NSLog(@"主进程，i= %d", i );
    }
    //使用异步函数封装三个任务
    dispatch_async(queue, ^{
        NSLog(@"任务1---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务1，i= %d", i );
        }
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务2，i= %d", i );
        }
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
        for (int i = 0; i<10000; i++) {
            NSLog(@"任务3，i= %d", i );
        }
    });
    NSLog(@"---end---");
    
}
void studyThreads1()    //异步执行 + 并行队列，执行完主线程后，才会开通多线程同时执行
{
    @autoreleasepool {
        //创建一个并行队列
        dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_CONCURRENT);
        NSLog(@"---start---");
        for (int i = 0; i<10000; i++) {
            NSLog(@"主进程，i= %d", i );
        }
        
        NSLog(@"---start---");
        
        //使用异步函数封装三个任务
        dispatch_async(queue, ^{
            NSLog(@"任务1---%@", [NSThread currentThread]);
            for (int i = 0; i<10000; i++) {
                NSLog(@"任务1，i= %d", i );
            }
        });
        dispatch_async(queue, ^{
            NSLog(@"任务2---%@", [NSThread currentThread]);
            for (int i = 0; i<10000; i++) {
                NSLog(@"任务2，i= %d", i );
            }
        });
        dispatch_async(queue, ^{
            NSLog(@"任务3---%@", [NSThread currentThread]);
            for (int i = 0; i<10000; i++) {
                NSLog(@"任务3，i= %d", i );
            }
        });
                
        NSLog(@"---end---");
    }
    //return 0;
}

int learnARC()
{
    @autoreleasepool {  //使对象在超出指定的生存范围时能够自动并正确的释放
        
        //alloc/new/copy/mutableCopy这些方法生成并持有对象
//        id obj1 = [[NSObject alloc]init];    //alloc = new
//        id obj2 = [NSObject new];
//        
//        
//        
//        //非自己生成的对象，可通过retain持有
//        id obj3 = [ NSMutableArray array];
        //[obj3 retain];
        
        
    }
    return 0;
}

int learnTimer()
{
    
    return 0;
}

int learnSFC()
{
    char* str1;
    str1 = queryProvInfo("C39SQ078HP65", "fatpd22");
    printf("%s\n", str1);
    
    char* str2;
    str2 = queryInfo("C39SQ078HP65", "fatpd22", "p=mpn");
    printf("%s\n", str2);
    
    char* str3;
    str3 = queryProcessCheck("C39SQ078HP65", "DFU", "fatpd22");
    printf("%s\n", str3);
    
    return 0;
}

int learnNSPredicate()
{
    //用于定义一个逻辑条件，通过该条件可以执行搜索或内存中的过滤操作
    //创建谓语，要求name以s开头
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"name like 's*'"];
    FKDog* dog1 = [[FKDog alloc] init];
    dog1.name = [NSMutableString stringWithString:@"sdafu"];
    BOOL result1 = [pred evaluateWithObject:dog1];
    NSLog(@"result1: %d", result1);
    
    
    return 0;
}

int learnNSOrderedSet()     //集合有序不重复
{
    NSOrderedSet* set1 = [ NSOrderedSet orderedSetWithObjects:[NSNumber numberWithInt:10],
                          [NSNumber numberWithInt:11],
                          [NSNumber numberWithInt:12],
                          [NSNumber numberWithInt:13],
                          [NSNumber numberWithInt:10],
                          nil];
    NSLog(@"%@", set1);
    
    NSLog(@"第一个元素：%@", [ set1 firstObject]);
    NSLog(@"最后一个元素：%@", [ set1 lastObject]);
    
    //获取指定索引的元素
    NSLog(@"%@", [ set1 objectAtIndex:2]);
    NSLog(@"12在set中的索引：%ld", [ set1 indexOfObject: [NSNumber numberWithInt: 12]]);
    
    //获取元素大于11的集合元素的索引
//   // NSIndexSet* indexSet = [set1 indexOfObjectPassingTest:^ (id obj, NSInteger idx, BOOL * stop) {
//        return (BOOL)([obj intValue] > 12);
//    }];
    
    
    
    return 0;
}

int learnNSCopy()
{
    @autoreleasepool {
        FKDog* dog1 = [FKDog new];  //创建对象
        dog1.name = [NSMutableString stringWithString:@"旺财"];
        dog1.age = 20;
        NSLog(@"dog1 name: %@", dog1.name);
        NSLog(@"dog1 age: %d", dog1.age);
        
        FKDog* dog2 = [dog1 copy];
//        dog2.name = [NSMutableString stringWithString:@"大福"];
//        dog2.age = 12;
//        NSLog(@"dog2 name: %@", dog2.name);
//        NSLog(@"dog2 age: %d", dog2.age);
        
        [dog2.name replaceCharactersInRange:NSMakeRange(0, 2) withString:@"大福"];
        NSLog(@"dog1 name: %@", dog1.name);
        NSLog(@"dog2 name: %@", dog2.name);
        
        
    }
    return 0;
}

int learnCopy()     //copy, mutablecopy 方法，复制已有对象的副本
{
    @autoreleasepool {
        //copy 返回对象的不可修改的副本
        //mutablecopy 返回对象的可修改的副本
        
        NSMutableString* book = [NSMutableString stringWithString:@"Hello world."];
        NSMutableString* bookcopy1 = [book mutableCopy];
        NSLog(@"%@",bookcopy1);
        
        [bookcopy1 replaceCharactersInRange:NSMakeRange(2, 3) withString:@"android"];
        NSLog(@"%@",bookcopy1);
        NSLog(@"%@",book);
        
        NSMutableString* bookcopy2 = [book copy];
        //[book appendString:@"ios"];
        NSLog(@"%@",bookcopy2);
        NSLog(@"%@",book);
    }
    return 0;
}

int learnNSMutableSet()
{
    @autoreleasepool {
        NSMutableSet* mset1 = [NSMutableSet setWithObjects:@"a",@"b",@"c",@"d", nil];
        //NSMutableSet* mset2 = [NSMutableSet setWithObjects:@"1",@"2",@"3",@"4", nil];
        NSMutableSet* mset3 = [NSMutableSet setWithObjects:@"1",@"c",@"d",@"4", nil];
        
        //只留下相等的元素
//        [mset1 intersectsSet:mset3];
//        NSLog(@"intersect: %@", mset1);
        
        //合并集合
        [mset1 unionSet:mset3];
        NSLog(@"union: %@", mset1);
        
        //删除指定元素
        [mset1 removeObject:@"a"];
        NSLog(@"remove: %@", mset1);
        
        //删除所有
        [mset1 removeAllObjects ];
        NSLog(@"mset1: %@", mset1);
    }
    return 0;
}

int learnNSSet()
{
    @autoreleasepool {
        NSSet* set1 = [NSSet setWithObjects:@"a",@"b",@"c",@"d", nil];
        NSSet* set2 = [NSSet setWithObjects:@"1",@"2",@"3",@"4", nil];
        NSArray* array1 = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
        NSSet* set3 = [NSSet setWithArray:array1];
        NSLog(@"set1: %@",set1);
        NSLog(@"set2: %@",set2);
        NSLog(@"set3: %@",set3);
        
        //获取集合的个数
        NSLog(@"set1 count: %lu",set1.count);
        
        //以数组的形式获取集合中的所有对象
        NSArray* allObj1 = [set1 allObjects];
        NSLog(@"allObj1: %@", allObj1);
        
        //获取任意对象
        for (int i= 0; i<10000; i++) {
            NSLog(@"i = %d, anyobj: %@", i, [set2 anyObject]);
        }
        
        //是否包含某个对象
        NSLog(@"contains: %d", [set1 containsObject:@"a"]);
        NSLog(@"contains: %d", [set1 containsObject:@"ab"]);
        
        //是否包含指定set中的对象
        NSLog(@"intersect obj: %d", [set1 intersectsSet:set3]);
        NSLog(@"intersect obj: %d", [set1 intersectsSet:set2]);

        //是否完全匹配
        NSLog(@"isEqual: %d", [set1 isEqual:set3]);
        
        //是否是子集合
        NSLog(@"isSubSet: %d", [set1 isSubsetOfSet:set3]);
        
        NSSet* set4 = [NSSet setWithObjects:@"a",@"b", nil];
        NSArray* array4 = [NSArray arrayWithObjects:@"1",@"2",@"c",@"d", nil];
        NSSet* set5 = [set4 setByAddingObjectsFromArray:array4];
        NSLog(@"set5: %@", set5);
        
    }
    return 0;
}

int learnNSMutableDictionary()
{
    @autoreleasepool {
        NSMutableDictionary* mdic1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"mvalue1", @"mkey1",
                                      @"mvalue2", @"mkey2",
                                      @"mvalue3", @"mkey3",
                                      @"mvalue4", @"mkey4",
                                      nil];
        NSLog(@"mdic1: %@", mdic1);
        
        //添加现有的字典数据
        NSDictionary* dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1",
                              @"value2", @"key2",
                              @"value3", @"key3",
                              @"value4", @"key4",
                              nil ];
        [mdic1 addEntriesFromDictionary:dic2];
        NSLog(@"mdic1: %@", mdic1);
        
        //添加新的键值对象
        [mdic1 setValue:@"set1" forKey:@"setkey1"];
        NSLog(@"mdic1: %@", mdic1);
        
        //以新的字典数据覆盖久的字典数据
        [mdic1 setDictionary:dic2];
        NSLog(@"mdic1: %@", mdic1);
        
        // 根据key删除value
        [mdic1 removeObjectForKey:@"key1"];
        NSLog(@"mdic1: %@", mdic1);
        
        //快速遍历
        for (id key in mdic1) {
            NSLog(@"key: %@, value: %@", key, [mdic1 objectForKey:key]);
            
        }
        
        //枚举遍历
        NSEnumerator* enumerator1 = [ mdic1 keyEnumerator];
        id keys = [enumerator1 nextObject];
        while (keys) {
            NSLog(@"enumerator:%@", [mdic1 objectForKey:keys]);
            keys = [enumerator1 nextObject];
        }
        
        //根据key的数组删除元素
        [mdic1 removeObjectForKey:@"key2"];
        NSLog(@"mdic1: %@", mdic1);
        
        //删除所有
        [mdic1 removeAllObjects];
        NSLog(@"mdic1: %@", mdic1);
        
    }
    return 0;
}

int learnNSDictionary()     //创建字典
{
    @autoreleasepool {
        //创建字典
        NSDictionary* dic1 = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
        NSLog(@"dic1:%@", dic1);
        
        //创建多个字典
        NSDictionary* dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1",
                              @"value2", @"key2",
                              @"value3", @"key3",
                              @"value4", @"key4",
                              nil ];
        NSLog(@"dic2:%@", dic2);
        
        //根据现有的字典创建字典
        NSDictionary* dic3 = [NSDictionary dictionaryWithDictionary:dic2];
        NSLog(@"dic3:%@", dic3);
        
        //根据key获取value
        NSLog(@"dic3:%@", [dic3 objectForKey:@"key1" ]);
    
        //获取字典的数量
        NSLog(@"dic3 count:%ld", dic3.count);
        
        //所有的键的集合, 字典转数组
        NSArray* keys = [dic3 allKeys];
        NSLog(@"keys: %@", keys);
        
        //所有的值集合
        NSArray* values = [dic3 allValues];
        NSLog(@"values: %@", values);
        
    }
    return 0;
}

int learnNSMutableArray()       //可变数组
{
    @autoreleasepool {
        //可变数组， 期望容量设置为3
        NSMutableArray* ma1 =  [NSMutableArray arrayWithCapacity:3];
        
        //添加元素
        [ma1 addObject:@"aaa"];
        [ma1 addObject:@"bbb"];
        [ma1 addObject:@"ccc"];
        NSLog(@"ma1: %@" , ma1);
        
        //插入元素
        [ma1 insertObject:@"ddd" atIndex:0];
        NSLog(@"ma1: %@" , ma1);
        
        //移除指定元素
        [ma1 removeObject:@"aaa"];
        NSLog(@"ma1: %@" , ma1);
        
        //移除指定下标元素
        [ma1 removeObjectAtIndex:0];
        NSLog(@"ma1: %@" , ma1);
        
        //移除最后一个
        [ma1 removeLastObject];
        NSLog(@"ma1: %@" , ma1);
        
        //添加数组
        NSArray* array2 = [NSArray arrayWithObjects:@"obj1",@"obj2",@"obj3", nil];
        [ma1 addObjectsFromArray:array2];
        NSLog(@"ma1: %@" , ma1);
        
        //移除指定数组中的内容
        [ma1 removeObjectsInArray:array2];
        NSLog(@"ma1: %@" , ma1);
        
        //指定索引替换对象
        [ma1 replaceObjectAtIndex:0 withObject:@"===="];
        NSLog(@"ma1: %@" , ma1);
        
        //删除所有对象
        [ma1 removeAllObjects];
        NSLog(@"ma1: %@" , ma1);
   
    }
    return 0;
}

int learnNSArray()      //NSArray代表有序，可重复的集合。NSSet代表无序，不可重复的集合。NSDictionary代表具有映射关系的集合
{
    @autoreleasepool {
        //类方法数组创建
        NSArray* array1 = [NSArray arrayWithObjects:@"obj1", nil];
        NSArray* array2 = [NSArray arrayWithObjects:@"obj1",@"obj2",@"obj3", nil];
        NSArray* array3 = [NSArray arrayWithArray:array2];
        
        NSLog(@"array1:%@", array1);
        NSLog(@"array2:%@", array2);
        NSLog(@"array3:%@", array3);
        
        //实例方法创建数组
        NSArray* array4 = [[NSArray alloc] initWithObjects:@"AAA", @"BBB", nil];
        NSLog(@"array4:%@", array4);
        
        //数组的个数
        NSLog(@"array3 count: %ld" , [array3 count]);
        
        //访问元素
        for (int i = 0; i < 3; i++) {
        NSLog(@"index: %d, array: %@", i, [array3 objectAtIndex:i]);
        }
        
        //追加
        NSArray* array5 = [ array4 arrayByAddingObject:@"CCC"];
        for (int i = 0; i < [array5 count]; i++) {
            NSLog(@"index: %d, array: %@", i, [array5 objectAtIndex:i]);
        }
        
        //根据指定的字符串连接数组元素, 数组转字符串
        NSString* joinstring1 = [array5 componentsJoinedByString:@"|"];
        NSLog(@"joinstring1:%@", joinstring1);
        
        //是否包含指定对象 1=包含
        NSLog(@"isContain: %d", [ array5 containsObject:@"AAA"]);
        
        //查找某个对象所在的索引
        NSLog(@"index of object: %ld", [array5 indexOfObject:@"BBB"]);
        
        //最后一个元素
        NSLog(@"lastObeject: %@", [array5 lastObject]);
        
        //遍历数组
        for (id element in array5) {
            NSLog(@"%@", element);
        }
        
    
    }
    
    return 0;
}

int learnArchiverMultiTest()    //一次性将多个对象归档到当个档案文件中，或
{
    @autoreleasepool {
        //
        NSDictionary* dict1 = @{
                                @"Objective-C": [NSNumber numberWithInt:89],
                                @"Ruby": [NSNumber numberWithInt:69],
                                @"Python": [NSNumber numberWithInt:75],
                                @"Perl": [NSNumber numberWithInt:109]};
        //创建一个NSSet对象
        NSSet* set1 = [NSSet setWithObjects:
                       @"疯狂ios讲义",
                       @"疯狂audroid讲义",
                       @"疯狂ajax讲义", nil];
//        FKApple* apple1 = [[FKApple alloc] initWithColor:@"Red" weight:3.5 size:90];
//        NSLog(@"%@", apple1.color);
        
        
        //创建一个NSMutableData对象，用于保存归档数据
        NSMutableData* data1 = [NSMutableData data];
        NSKeyedArchiver* arch1 = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data1];
        //重复调用
        [arch1 encodeObject:dict1 forKey:@"dict1"];
        [arch1 encodeObject:set1 forKey:@"set1"];
        //[arch1 encodeObject:apple1 forKey:@"apple1"];
        [arch1 finishEncoding];     //结束归档
        if ([data1 writeToFile:@"/Users/gdadmin/Desktop/LeoFile/myInfo.archive" atomically:YES] == NO) {
            NSLog(@"归档失败");
        }
        else
        {
            NSLog(@"归档成功");
        }
        
        NSData* data2 = [NSData dataWithContentsOfFile:@"/Users/gdadmin/Desktop/LeoFile/myInfo.archive"];
        NSKeyedUnarchiver* unchiv2 = [[NSKeyedUnarchiver alloc] initForReadingWithData:data2];
        NSDictionary* dict2 = [unchiv2 decodeObjectForKey:@"dict1"];
        NSSet* set2 = [unchiv2 decodeObjectForKey:@"set1"];
        //FKApple* apple2 = [unchiv2 decodeObjectForKey:@"apple1"];
        [unchiv2 finishDecoding];
        NSLog(@"%@", dict2);
        NSLog(@"%@", set2);
        //NSLog(@"%@", apple2);
        
            
    }
    return 0;
}


int learnNSKeyedArchiver()      //归档
{
    @autoreleasepool {
        NSDictionary* dic1 = @{
                @"Objective-C": [NSNumber numberWithInt:89],
                @"Ruby": [NSNumber numberWithInt:69],
                @"Python": [NSNumber numberWithInt:75],
                @"Perl": [NSNumber numberWithInt:109]};
        //归档
        NSLog(@"return= %hhd",[NSKeyedArchiver archiveRootObject:dic1 toFile:@"/Users/gdadmin/Desktop/LeoFile/myInfo.archive"]);
        
        NSDictionary* dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/gdadmin/Desktop/LeoFile/myInfo.archive"];
        NSLog(@"Objective-C: %@", dic2[@"Objective-C"]);
        NSLog(@"Ruby: %@", dic2[@"Ruby"]);
        NSLog(@"Python: %@", dic2[@"Python"]);
        NSLog(@"Perl: %@", dic2[@"Perl"]);
        
    }
    return 0;
}

int learnNSBundle()
{
    
    return 0;
}
int learnNSURL()    //URL:指向互联网“资源“的指针
{
    NSURL* url1 = [NSURL URLWithString:@"http://www.apple.com"];
    NSLog(@"url1的scheme为:%@", [url1 scheme]);
    NSLog(@"url1的host为:%@", [url1 host ]);
    NSLog(@"url1的port为:%@", [url1 port ]);
    NSLog(@"url1的path为:%@", [url1 path]);
    
    //使用URL资源初始化NSString对象
    NSString* homePage = [NSString stringWithContentsOfURL:url1 encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", homePage);
    
    return 0;
}

int learnNSFileHandle()     //处理文件的IO
{
    //打开一个文件准备读取
    NSFileHandle* fh1 = [NSFileHandle fileHandleForReadingAtPath:@"/Users/gdadmin/Desktop/Leowen/myInfo.txt"];
    NSData* data1;
    
    while ([(data1 = [fh1 readDataOfLength:100]) length] > 0) { //根据lengh判断是否读到文件的结尾处
        NSLog(@"data1 lengh: %ld", [data1 length]);
        NSString* content1 = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
        NSLog(@"content1= %@", content1);
    }
    [fh1 closeFile];    //关闭文件
    
    //打开一个文件准备写
    NSFileHandle* fh2 = [NSFileHandle fileHandleForWritingAtPath:@"/Users/gdadmin/Desktop/Leowen/myInfo.txt"];
    if (!fh2) {   //fh2 = 0, 打开失败，新建文件
        NSFileManager* fm2 = [NSFileManager defaultManager];
        [fm2 createDirectoryAtPath:@"/Users/gdadmin/Desktop/Leowen/myInfo.txt" withIntermediateDirectories:YES attributes:nil error:nil];
        fh2 = [NSFileHandle fileHandleForWritingAtPath:@"/Users/gdadmin/Desktop/Leowen/myInfo.txt"];
    }
    [fh2 seekToEndOfFile];  //将指针移动到文件的结尾处
    NSString* str2 = @"Hello\n";
    [fh2 writeData:[str2 dataUsingEncoding:NSUTF8StringEncoding]];
    [fh2 closeFile];
    
    return 0;
}

int learnNSProcessInfo()    //获取进程的信息
{
    NSProcessInfo* processInfo1 = [NSProcessInfo processInfo];
    
    //获取运行程序所制定的参数
    NSArray* array1 = [ processInfo1 arguments];
    NSLog(@"运行程序的参数为：%@", array1);
    //[processInfo1 processIdentifier]
    NSLog(@"进程标示符：%d", [processInfo1 processIdentifier]);
    NSLog(@"进程名：%@", [processInfo1 processName]);
    NSLog(@"主机名：%@", [processInfo1 hostName]);
    
    NSOperatingSystemVersion version = [processInfo1 operatingSystemVersion];
    NSLog(@"进程的系统主版本：%ld", version.majorVersion);
    NSLog(@"进程的系统次版本：%ld", version.minorVersion);
    NSLog(@"进程的系统补丁版本：%ld", version.patchVersion);
    NSLog(@"进程的系统的版本字符串：%@", [processInfo1 operatingSystemVersionString] );
    NSLog(@"进程的系统的物理内存：%lld", [processInfo1 physicalMemory]);
    NSLog(@"进程的系统的处理器的数量：%ld", [processInfo1 processorCount]);
    NSLog(@"进程的系统的激活的处理器的数量：%ld", [processInfo1 activeProcessorCount]);
    NSLog(@"进程的系统的运行时间：%f", [processInfo1 systemUptime]);
    
    
    return 0;
}

int learnNSFileManager()    //文件管理器
{
    //文件特性的判断，存在，可读，可写...
    NSFileManager* fm1 = [NSFileManager defaultManager];
    //真＝1
    NSLog(@"1.txt是否存在：%d", [fm1 fileExistsAtPath:@"/Users/gdadmin/Desktop/LeoFile/1.txt"]);
    
    int i =0;
    i = [fm1 isReadableFileAtPath:@"/Users/gdadmin/Desktop/LeoFile/1.txt"];
    NSLog(@"1.txt是否存在：%d", i );
    
    i = [fm1 isWritableFileAtPath:@"/Users/gdadmin/Desktop/LeoFile/1.txt"];
    NSLog(@"1.txt是否存在：%d", i );
    
    i = [fm1 isExecutableFileAtPath:@"/Users/gdadmin/Desktop/LeoFile/1.txt"];
    NSLog(@"1.txt是否存在：%d", i );
    
    i = [fm1 isDeletableFileAtPath:@"/Users/gdadmin/Desktop/LeoFile/1.txt"];
    NSLog(@"1.txt是否存在：%d", i );
    
    i = [fm1 isReadableFileAtPath:@"/Users/gdadmin/Desktop/LeoFile/1.txt"];
    NSLog(@"1.txt是否存在：%d", i );
    
    //创建目录
    NSFileManager* fm2 = [NSFileManager defaultManager];
    [fm2 createDirectoryAtPath:@"/Users/gdadmin/Desktop/Leowen/" withIntermediateDirectories:YES attributes:nil error:nil];
    //创建文件
    NSString* content2 = @"iOS";
    [fm2 createFileAtPath:@"/Users/gdadmin/Desktop/Leowen/myInfo.txt" contents:[content2 dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    //复制新文件
    [fm2 copyItemAtPath:@"/Users/gdadmin/Desktop/Leowen/myInfo.txt" toPath:@"/Users/gdadmin/Desktop/Leowen/copyInfo.txt" error:nil];
    
    //获取目录下的文件
    NSFileManager* fm3 = [NSFileManager defaultManager];
    //获取当前目录下所有的文件和文件夹“.”
    NSArray* array3 = [fm3 contentsOfDirectoryAtPath:@"." error:nil];
    for (NSString* item3 in array3) {
        NSLog(@"%@", item3);
    }
    
    //获取上一级目录下所有的文件和文件夹“.”
    NSArray* array4 = [fm3 contentsOfDirectoryAtPath:@".." error:nil];
    for (NSString* item4 in array4) {
        NSLog(@"上一级目录：%@", item4);
    }
    
    return 0;
}

int learnNSData()
{
    //读取指定URL对应的数据
    NSData* data1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.apple.com"]];
    NSLog(@"data1 lenth: %ld", [data1 length]);
    
    char buffer[100];
    //将指定范围的数据读入到数组
    [data1 getBytes:buffer range:NSMakeRange(1, 100)];
    NSLog(@"buffer= %s",buffer);
    
    NSString* content1 = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
    NSLog(@"%@", content1);
    
    //读取指定文件的数据
    NSData* data2 = [NSData dataWithContentsOfFile:@"/Users/gdadmin/Desktop/LeoFile/1.txt"];
    NSLog(@"data2 lengh = %ld", [data2 length]);
    
    NSString* content2 = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
    NSLog(@"content2= %@", content2);
    
    return 0;
}
int learnFKPerson()
{
    FKPerson* person = [[FKPerson alloc] init];
    [person setName:@"l"];
    [person setName:@"Leo"];
    NSLog(@"%@", [person name]);
    
    [person setAge:125];
    [person setAge:24];
    [person setValue:@"26" forKey:@"age"];
    //person.age = 25;
    NSLog(@"%d", [person age]);
    
    [person setBirth:[NSDate date]];
    NSLog(@"birth: %@", [person birth]);
    
    NSMutableString* strBook =[[NSMutableString alloc] init];
    strBook =[NSMutableString stringWithString: @"疯狂ios讲义"];
    [person setBookname:strBook];
    NSLog(@"book name: %@", [person bookname]);
    [strBook appendString:@"是一本很好的ios学习图书"];
    NSLog(@"book name: %@", [person bookname]);
    NSLog(@"book name: %@", person.bookname);   //oc可使用点语法访问属性和对属性赋值
    
    //KVC: KeyValueCoding,
    FKPerson* person1 = [[FKPerson alloc]init];
    [person1 setValue:@"leo" forKey:@"bookname"];
    NSLog(@"bookname: %@",person1.bookname);
    NSLog(@"bookname: %@",[person1 valueForKey:@"bookname"]);
    
    //will show error(nil)
    //[person1 setValue:nil forKey:@"bookname"];
    
    //key路径
    //[person1 setValue:<#(id)#> forKeyPath:<#(NSString *)#>];
    
    //键值监听KVO,Key Value Observing,
    
    FKPerson* item = [[FKPerson alloc]init];
    item.name = @"ios";
    item.price = 23;
    //创建
    
    
    return 0;
}

int learnFKSingleton()
{
    //判断两次获取的实例是否相等
    NSLog(@"instance:%d", [FKSingleton instance] == [FKSingleton instance]);
    NSLog(@"instance1:%d", [FKSingleton instance1] == [FKSingleton instance1]);
    return 0;
}

int learnNSTimer()
{
    
    return 0;
}

int learnNSCalendar()
{
    //获取代表公历的NSCalendar对象
    //NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSDate* date1 = [NSDate date];
    
    //定义一个时间字段的旗标，指定将会获取指定的年，月，日，时，分，秒信息
    //unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |
    //NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    
    //获取不同时间字段的信息
    
    //NSDateComponents* comp = [gregorian component:unitFlags fromDate:date1];
    
    //NSLog(@"现在是：％1d", comp.yyyy);
    
    
    return 0;
}


int learnNSDateFormatter()  //日期的格式器
{
    NSDate* date1 = [NSDate date];
    NSLocale* locale1[] = {
        [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"],   //china
        [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]};  //USA
    
    NSDateFormatter* df[8];
    
    for (int i=0; i<2; i++) {
        df[i*4] = [[NSDateFormatter alloc] init ];
        
        //设置日期和时间风格
        [df[i*4] setDateStyle:NSDateFormatterShortStyle];
        [df[i*4] setTimeStyle:NSDateFormatterShortStyle];
        
        //set NSLocale
        [df[i*4] setLocale:locale1[i]];
        
        df[i*4+1] = [[NSDateFormatter alloc] init ];
        
        //设置日期和时间风格
        [df[i*4+1] setDateStyle:NSDateFormatterMediumStyle];
        [df[i*4+1] setTimeStyle:NSDateFormatterMediumStyle];
        
        //set NSLocale
        [df[i*4+1] setLocale:locale1[i]];
        
        df[i*4+2] = [[NSDateFormatter alloc] init ];
        
        //设置日期和时间风格
        [df[i*4+2] setDateStyle:NSDateFormatterLongStyle];
        [df[i*4+2] setTimeStyle:NSDateFormatterLongStyle];
        
        //set NSLocale
        [df[i*4+2] setLocale:locale1[i]];
        
        df[i*4+3] = [[NSDateFormatter alloc] init ];
        
        //设置日期和时间风格
        [df[i*4+3] setDateStyle:NSDateFormatterFullStyle];
        [df[i*4+3] setTimeStyle:NSDateFormatterFullStyle];
        
        //set NSLocale
        [df[i*4+3] setLocale:locale1[i]];
        
    }
    
    for (int i = 0; i < 2; i++) {
        
        switch (i) {
            case 0:
                NSLog(@"----------------中国日期格式----------------");
                break;
            case 1:
                NSLog(@"----------------美国日期格式----------------");
                break;
        }
        
        NSLog(@"ShortStyle:%@", [df[i*4] stringFromDate:date1]);
        NSLog(@"MediumStyle:%@", [df[i*4+1] stringFromDate:date1]);
        NSLog(@"LongStyle:%@", [df[i*4+2] stringFromDate:date1]);
        NSLog(@"FullStyle:%@", [df[i*4+3] stringFromDate:date1]);
    }
    
    
    //设定自定义的格式模版
    NSDateFormatter* df2 = [[NSDateFormatter alloc] init];
    [df2 setDateFormat:@"公元y yyy 年 MM 月 DD 日 HH 时 mm 分"];
    NSLog(@"%@", [df2 stringFromDate:date1]);
    
    
    //字符串转时间
    NSString* datestr = @"2017-03-23";
    NSDateFormatter* df3 = [[NSDateFormatter alloc] init];
    [df3 setDateFormat:@"yyyy-MM-dd"];
    NSDate* date2 = [df3 dateFromString:datestr];
    NSLog(@"%@",date2);
    
    
    return 0;
}


int learnNSDate()
{
    //返回现在的时间
    NSDate* date1 = [NSDate date];
    NSLog(@"%@",date1);
    
    //获取当前一天之后的时间
    NSDate* date2 = [[NSDate alloc] initWithTimeIntervalSinceNow:3600*24];
    NSLog(@"%@",date2);
    
    //获取当前一天之前的时间
    NSDate* date3 = [[NSDate alloc] initWithTimeIntervalSinceNow:-3600*24];
    NSLog(@"%@",date3);
    
    //获取从1970年20年之后的时间
    NSDate* date4 = [[NSDate alloc] initWithTimeIntervalSince1970:3600*24*365*20];
    NSLog(@"%@", date4);
    
    //获取当前的NSLocale下对应的字符串
    NSLocale * locale1 = [NSLocale currentLocale];
    NSLog(@"%@", [date1 descriptionWithLocale:locale1]);
    
    //获取较早的时间
    NSDate* earlier = [date1 earlierDate:date2];
    NSLog(@"date1: %@, date2: %@, 获取较早的时间：%@", date1, date2, earlier);
    
    //获取较晚的时间
    NSDate* later = [date1 laterDate:date2];
    NSLog(@"date1: %@, date2: %@, 获取较晚的时间：%@", date1, date2, later);
    
    // compare
    switch ([date1 compare: date2]) {
        case NSOrderedAscending:
            NSLog(@"date1:%@,位于date2:%@之前", date1, date2);
            break;
        case NSOrderedSame:
            NSLog(@"date1:%@,位于date2:%@日期相等", date1, date2);
            break;
        case NSOrderedDescending:
            NSLog(@"date1:%@,位于date2:%@之前", date1, date2);
            break;
            
        default:
            break;
    }
    
    //获取两个时间之间的时间差
    int t1 = [date1 timeIntervalSinceDate:date2];
    NSLog(@"date1与date2之间时间差：%d秒。", t1);
    
    int t2 = [date2 timeIntervalSinceNow];
    NSLog(@"date2与现在之间时间差：%d秒。", t2);
    
    
    return 0;
}

int learnClass()
{
    //FKPerson* person = [[FKPerson alloc] init];
    //[person setName:@"Leo" andAge:23];
    
    
    

    return 0;
}

int learnNSString()
{
    NSLog(@"Learn NSString;");
    
    //创建一个空的字符串
    NSString * string1=[[NSString alloc]init];
    NSLog(@"string1 = %@\n", string1);
    string1 = @"Hello, ios";
    NSString * string2 = [NSString string];
    NSLog(@"string2 = %@\n", string2);
    string2 = @"Hello";
    
    //创建一个字符串常量
    NSString * string3=@"Hello World";
    NSLog(@"string3=%@,%p\n",string3,string3);
    
    //根据已有的字符串创建新的字符串(常量区)
    NSString*string4_1=[[NSString alloc]initWithString:string3];
    NSLog(@"string4_1:%@,%p",string4_1,string4_1);
    NSString*string4_2=[NSString stringWithString:string3];
    NSLog(@"string4_2:%@,%p",string4_2,string4_2);
    
    //根据已有的字符串创建新的字符串（堆区）
    NSString*string5_1=[[NSString alloc]initWithFormat:@"%@",string3];
    NSLog(@"string5_1:%@,%p",string5_1,string5_1);
    NSString*string5_2=[NSString stringWithString:string3];
    NSLog(@"string5_2:%@,%p",string5_2,string5_2);
    
    //字符串的比较
    if(string4_1==string4_2)//指针的比较
    {
        NSLog(@"相同指针");
    }
    if([string5_1 isEqualToString: string5_2])//内容比较
    {
        NSLog(@"相同内容");
    }
    else
        NSLog(@"不同内容");
    BOOL isSame=[string5_1 isEqualToString: string5_2];//内容比较，相同语句
    if(isSame) {
        NSLog(@"内容相同");
    }
    else
        NSLog(@"内容不同");
    
    //字符串长度
    NSString * string7=@"This-is-a-string";
    NSLog(@"字符串%@的长度等于：%ld",string7, [string7 length]);//等同于string7.length
    
    //截取字符串：根据已有的字符串，返回新的子字符串(截取其中某些位置的字符串）
    NSLog(@"截取字符串：根据已有的字符串，返回新的子字符串(截取其中某些位置的字符串");
    NSString * substring1=[string7 substringFromIndex:4];//从第几位开始截取
    NSString*substring2=[string7 substringToIndex:6];//截取到第几位
    NSString*substring3=[string7 substringWithRange:NSMakeRange(5,4)];//选取某一区域截取,从第5开始后的4个字符
    NSRange range={5,4};
    range.location=6;//后期修改位置
    range.length=10;//后期修改截取长度
    NSString*substring4=[string7 substringWithRange:range];//选择某一区域截取
    NSLog(@"substring1:%@",substring1);
    NSLog(@"substring2:%@",substring2);
    NSLog(@"substring3:%@",substring3);
    NSLog(@"substring4:%@",substring4);
    
    for(int i=0; i<[string7 length]; i++) {
        NSLog(@"substing:%@",[string7 substringWithRange:NSMakeRange(i,1)]); //遍历字符串
    }

    
    //按照字符串转数组,某个字符转成数组
    NSArray * array1=[string7 componentsSeparatedByString:@"-"];//根据“-”分成数组
    NSLog(@"string->array:%@",array1);
    NSString * string8=@"THiS iS a String";
    NSLog(@"%@",[string8 uppercaseString]);//大写（不改变String8）
    NSLog(@"%@",[string8 lowercaseString]);//小写（不改变String8）
    NSLog(@"%@",[string8 capitalizedString]);//首字母大写（不改变String8）
    //比较字符串的大小, 根据字符串的排序
    NSString*string9_1=@"bc";
    NSString*string9_2=@"ad";
    NSComparisonResult result =[string9_1 caseInsensitiveCompare: string9_2];//NSComparisonResult属于枚举
    NSLog(@"");
    switch(result) {
        case NSOrderedAscending:
            NSLog(@"9_1小");
            break;
        case NSOrderedSame:
            NSLog(@"9_1等于");
            break;
        case NSOrderedDescending:
            NSLog(@"9_1大");
            break;
        default:
            break;
    }

    //字符串的查找
    NSLog(@"字符串的查找");
    NSString*string10=@"abcdefghijklmnopq";
    NSRange range1=[string10 rangeOfString:@"hijk"];
    if(range1.length>0) {
        NSLog(@"找到了");
    }
    NSLog(@"%ld,%ld",range1.length,range1.location);//第七位，长度为4
    NSLog(@"%@",NSStringFromRange(range1));
    NSLog(@"%@",NSStringFromClass([NSString class]));
    //        NSStringFromClass([NSString class]);
    //判断字符串是不是以*字符串开头
    BOOL isPre=[string10 hasPrefix:@"abc"];
    if(isPre) {
        NSLog(@"是以abc开头");
    }
    
    //字符串的拼接
    NSString*string11_1=@"good";
    NSString*string11_2=@"moring";
    NSString*string11=[NSString stringWithFormat:@"%@,%@",string11_1,string11_2];
    NSLog(@"string11:%@",string11);
    NSString*string12=[string11_1 stringByAppendingString:string11_2];//最常用
    NSLog(@"string12:%@",string12);
    //[string1 initWithUTF8String:<#(const char *)#>]
    
    //子类复用父类成员变量、属性、方法
    /***************************NSMutableString*****************************/
    //NSMutableString是NSString的子类（继承关系）
    NSMutableString*mutableString1=[NSMutableString stringWithFormat:@"HelloWorld"];
    NSLog(@"muatbleString1:%@",mutableString1);
    
    //插入，第一个参数表示需要插入的字符串，第二个参数是放置的位置
    [mutableString1 insertString:@"_ios"atIndex:[mutableString1 length]];
    NSLog(@"mutableString:%@",mutableString1);
    
    //替换,第一个参数表示需要替换的位置，第二个参数是要替换的字符串
    [mutableString1 replaceCharactersInRange:NSMakeRange([mutableString1 length]-3,3)withString:@"apple"];
    NSLog(@"mutableString1:%@",mutableString1);
    
    //删除
    NSRange deleteRange=NSMakeRange([mutableString1 length]-6,6);  //-6,当前位置减6
    [mutableString1 deleteCharactersInRange:deleteRange];
    NSLog(@"mutableString1:%@",mutableString1);

    //查找->使用不可变的rangeOfString
//#prama Mark -判断字符串包含另一个字符串的内容
    if([string1 rangeOfString:string2].location!=NSNotFound) {
        //string1包含string2的内容
        //DoSomething…
        NSLog(@"string1：%@包含string2: %@中的字符串", string1, string2);
        
    }
    else
    {
       NSLog(@"string1：%@不包含string2: %@中的字符串", string1, string2);
    }
    //[string1 initWithString:<#(NSString *)#>]
    if([@"" rangeOfString:string2].location!=NSNotFound) {
        //string1包含string2的内容
        //DoSomething…
        NSLog(@"1：包含string2: %@中的字符串",  string2);
        
    }
    else
    {
        NSLog(@"1：不包含string2: %@中的字符串", string2);
    }
    
    return 0;
}




