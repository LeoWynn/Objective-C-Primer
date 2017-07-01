#import "FKBase.h"

@implementation FKBase

- (void) base
{
    NSLog(@"父类的普通base方法");
}

- (void) test
{
    NSLog(@"父类的将被覆盖的方法test");
}

@end