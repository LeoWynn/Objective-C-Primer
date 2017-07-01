

#import "FKDog.h"


@implementation FKDog

- (id) copyWithZone: (NSZone*) zone
{
    NSLog(@"执行copyWithZone");
    
    //使用zone参数创建FKDog对象
    FKDog* dog = [[[self class] allocWithZone:zone] init ];
    //dog.name = self.name; //浅复制
    dog.name = [self.name mutableCopy];   //深复制
    dog.age = self.age;
    return dog;
}


@end
