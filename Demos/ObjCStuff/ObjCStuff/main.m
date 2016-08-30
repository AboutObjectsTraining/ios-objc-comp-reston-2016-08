#import <Foundation/Foundation.h>

void doStuff(void)
{
    NSString *s = [@"Hello" stringByAppendingString:@" World!"];
    NSLog(@"%@", s);
}

int main(int argc, const char * argv[]) {
    doStuff();
}
