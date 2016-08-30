#import "CoolView.h"

@interface CoolView ()

@property (nonatomic, assign) BOOL highlighted;

@end


@implementation CoolView


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
