#import "CLNCoolView.h"

const CGFloat CLNTextPadding = 8.0;
const NSTimeInterval CLNDefaultDuration = 1.0;

IB_DESIGNABLE
@interface CLNCoolView ()

@property (nonatomic, assign) BOOL highlighted;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
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

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizer];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizer];
    
    return self;
}

- (void)prepareForInterfaceBuilder
{
    [self configureLayer];
    [self sizeToFit];
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}
- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (void)bounce
{
    CGSize size = CGSizeMake(120.0, 240.0);
    [self animateBounceWithSize:size];
}

- (void)animateEndOfBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size
{
    [UIView animateWithDuration:duration animations:^{
        self.transform = CGAffineTransformIdentity;
        self.frame = CGRectOffset(self.frame, -size.width, -size.height);
    }];
}

- (void)configureBounceAnimationWithSize:(CGSize)size
{
    [UIView setAnimationRepeatCount:3.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    self.frame = CGRectOffset(self.frame, size.width, size.height);
    self.transform = CGAffineTransformMakeRotation(M_PI_2);
}

- (void)animateBounceWithSize:(CGSize)size
{
    [UIView animateWithDuration:CLNDefaultDuration
                     animations:^{ [self configureBounceAnimationWithSize:size]; }
                     completion:^(BOOL finished) { [self animateEndOfBounceWithDuration:CLNDefaultDuration size:size]; }];
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
