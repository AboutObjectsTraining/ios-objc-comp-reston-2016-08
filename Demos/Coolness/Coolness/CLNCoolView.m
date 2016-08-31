#import "CLNCoolView.h"


const CGFloat CLNTextPadding = 8.0;

@interface CLNCoolView ()

@property (nonatomic, assign) BOOL highlighted;

@end


@implementation CLNCoolView

- (void)configureLayer
{
    self.layer.borderWidth = 2.0;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.cornerRadius = 10.0;
    self.layer.masksToBounds = YES;
}

- (void)configureGestureRecognizer
{
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizer];
    
    return self;
}


- (void)bounce
{
    CGSize size = CGSizeMake(120.0, 240.0);
    [self animateBounceWithSize:size];
    
    NSDictionary *info = @{ @"size": [NSValue valueWithCGSize:size],
                            @"duration": [NSNumber numberWithDouble:1.0] };
    
    [NSTimer scheduledTimerWithTimeInterval:7.0
                                     target:self
                                   selector:@selector(endBounce:)
                                   userInfo:info
                                    repeats:NO];
}

- (void)endBounce:(NSTimer *)timer
{
    NSDictionary *info = timer.userInfo;
    NSValue *sizeValue = info[@"size"];
    CGSize size = sizeValue.CGSizeValue;
    NSNumber *durationValue = info[@"duration"];
    double duration = durationValue.doubleValue;
    
    [self animateEndOfBounceWithDuration:duration size:size];
}

- (void)animateEndOfBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    
    self.transform = CGAffineTransformIdentity;
    self.frame = CGRectOffset(self.frame, -size.width, -size.height);
    
    [UIView commitAnimations];
}

- (void)animateBounceWithSize:(CGSize)size
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:3.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.frame = CGRectOffset(self.frame, size.width, size.height);
    self.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    [UIView commitAnimations];
}


/// Returns a dictionary of string attributes.
/// @see NSAttributedString
+ (NSDictionary *)textAttributes
{
    return @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0],
              NSForegroundColorAttributeName: [UIColor whiteColor] };
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize newSize = [self.text sizeWithAttributes:[self.class textAttributes]];
    newSize.width += CLNTextPadding * 2;
    newSize.height += CLNTextPadding * 2;
    return newSize;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint origin = CGPointMake(CLNTextPadding, CLNTextPadding);
    [self.text drawAtPoint:origin withAttributes:[self.class textAttributes]];
}


- (void)setHighlighted:(BOOL)highlighted
{
    self.alpha = highlighted ? 0.5 : 1.0;
    _highlighted = highlighted;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:self];
    CGPoint prevLocation = [touch previousLocationInView:self];
    
    CGPoint newLocation = self.center;
    newLocation.x += currLocation.x - prevLocation.x;
    newLocation.y += currLocation.y - prevLocation.y;
    
    self.center = newLocation;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
}

@end
