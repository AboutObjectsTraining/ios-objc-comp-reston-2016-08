#import <XCTest/XCTest.h>

//void sayHello2(void *context)
//{
//    int count = (int) (*context);
//    for (int i = 0; i < count; i++) {
//        printf("Hello!\n");
//    }
//}


void sayHello(int count)
{
    for (int i = 0; i < count; i++) {
        printf("Hello!\n");
    }
}

@interface BlockTests : XCTestCase  @end

@implementation BlockTests

- (void)setUp {    [super setUp];    printf("\n"); }
- (void)tearDown {    printf("\n");    [super tearDown]; }

- (void)testFunctionPointer
{
    void (*myFunc)(int);
    
    int count = 3;
    
    myFunc = sayHello;
    
    myFunc(count);
}

- (void)testBlock
{
    void (^myBlock)(void);
    
    int count = 3;
    
    myBlock = ^{
        for (int i = 0; i < count; i++) {
            printf("Hello!\n");
        }
    };
    
    NSLog(@"%@", [myBlock description]);
    id copyOfMyBlock = [myBlock copy];
    
    myBlock();
}


@end
