#import <Foundation/Foundation.h>

@interface Person : NSObject // <NSCopying>

- initWithFirstName:(NSString *)firstName
           lastName:(NSString *)lastName
                age:(int)age;

+ (instancetype)personWithFirstName:(NSString *)firstName
                           lastName:(NSString *)lastName
                                age:(int)age;

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, readonly) NSString *fullName;

@property (nonatomic, assign) int age;

@property (nonatomic, assign) NSUInteger favoritesRanking;
@property (nonatomic, readonly) NSString *favoritesRankingStars;

@property (nonatomic, weak) Person *spouse;

@property (nonatomic, strong) Person *dog;

@end


@interface Person (Describing)

- (void)display;

@end


