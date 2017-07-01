#import "FKSubBase.h"


@implementation FKSubBase

//重写test方法
- (void) test
{
    NSLog(@"子类的覆盖父类的test方法");
}

- (void) sub
{
    NSLog(@"子类的sub方法");
}


@end