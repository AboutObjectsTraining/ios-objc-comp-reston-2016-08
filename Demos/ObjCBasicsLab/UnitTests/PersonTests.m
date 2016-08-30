#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

- (void)setUp {
    [super setUp];
    printf("\n");
}

- (void)tearDown {
    printf("\n");
    [super tearDown];
}

- (void)testSomeStuff
{
    Person *fred = [[Person alloc] init];
    
    NSLog(@"Testing person %@", fred);
    
    XCTAssertEqualObjects(@"Foo", @"Foo");
    
    for (NSString *s in @[@"foo"]) {
        NSLog(@"%@", s);
    }
}

- (void)testSomeOtherStuff
{
    NSLog(@"Testing some other stuff...");
}

@end
