//
//  LPFloatingMessageView.m
//  FloatingMessage
//
//  Created by Luis Perez on 25/01/16.
//  Copyright © 2016 Orbis. All rights reserved.
//

#import "LPFloatingMessageView.h"



@implementation LPFloatingMessageView {
    __weak IBOutlet NSLayoutConstraint *loadingIndicatorWidthConstraint;
    __weak IBOutlet UILabel *messageLabel;
    
    __weak id parentView;
    NSLayoutConstraint *topConstraint;
}

@synthesize message = _message;


- (id) initWithParentView:(id)_parentView {
    
    if (self != nil) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"LPFloatingMessageView" owner:self options:nil] lastObject];
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        self.loadingIndicatorView.transform = CGAffineTransformMakeScale(0.75, 0.75);
        parentView = _parentView;
    }
    return self;
}



- (void) setUpBackgroundLayouts {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    if (!self.loadingIndicatorEnabled) {
        loadingIndicatorWidthConstraint.constant = 0.0;
        [self.loadingIndicatorView stopAnimating];
    }
    topConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:-30.0];
    [self.superview addConstraint:topConstraint];
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]]; // Center X Constraint
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:10.0]]; // Trailing Constraint
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.superview attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10.0]]; // Leading Constraint
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0]]; // Height Constraint
    [self.superview layoutIfNeeded];
    
    
    
}

- (void) showMessage:(void (^)(BOOL animationFinished)) stateHandler {
    [parentView addSubview:self];

    topConstraint.constant = 30.0;
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:10.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.superview layoutIfNeeded];
    }
    completion:^(BOOL finished) {
        stateHandler(YES);
    }];
    
}


- (void) hideMessage:(void (^)(BOOL animationFinished)) stateHandler {
    
    topConstraint.constant = -30.0;
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:10.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self layoutIfNeeded];
                         [self.superview layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                         stateHandler(YES);
                     }
     ];
}


- (void) setMessage:(NSString *)message {
    _message = message;
    messageLabel.text = message;
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:10.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{       [self.superview layoutIfNeeded];        } completion:nil];
}


- (void) updateMessage:(NSString *)message animationFinished:(void (^)(BOOL animationFinished)) stateHandler loadingIndicatorEnabled:(BOOL)loadingIndicatorEnabled {
    _message = message;
    messageLabel.text = message;
    if (!loadingIndicatorEnabled) {
        loadingIndicatorWidthConstraint.constant = 0.0;
        [self.loadingIndicatorView stopAnimating];
    }
    else {
        loadingIndicatorWidthConstraint.constant = 20.0;
        [self.loadingIndicatorView startAnimating];
    }
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:10.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{       [self.superview layoutIfNeeded];        } completion:nil];
}


- (void)didMoveToSuperview {
    if (self.superview) {
        [self setUpBackgroundLayouts];
    }
}


@end
