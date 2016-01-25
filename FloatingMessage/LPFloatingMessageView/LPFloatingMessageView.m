//
//  LPFloatingMessageView.m
//  FloatingMessage
//
//  Created by Luis Perez on 25/01/16.
//  Copyright © 2016 Orbis. All rights reserved.
//

#import "LPFloatingMessageView.h"

#define MESSAGE_WIDTH 100

@implementation LPFloatingMessageView

- (id) init {
    self = [super init];
    if (self != nil) {
        [self setUpFrame];
        [self setUpLabel];
    }
    return self;
}

- (void) setUpFrame {
    self.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:255.0/255.0 alpha:0.3]; 
}

- (void) setUpLabel {
    self.messageLabel = [[UILabel alloc] init];
    self.messageLabel.text = @"HOLAA";
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.backgroundColor = [UIColor greenColor];
    [self addSubview:self.messageLabel];
    
}

- (void)setUpConstraints {
    [self setUpBackgroundLayouts];
    [self setUpLabelLayouts];
}


- (void) setUpBackgroundLayouts {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:20.0];
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150.0];
    
    [self.superview addConstraint:topConstraint];
    [self.superview addConstraint:centerXConstraint];
    [self addConstraint:heightConstraint];
    [self addConstraint:widthConstraint];

}

- (void) setUpLabelLayouts {
    
    [self.messageLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *trailingSpaceConstraint = [NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:10.0];
    NSLayoutConstraint *leadingSpaceConstraint = [NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10.0];
    NSLayoutConstraint *topSpaceConstraint = [NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bottomSpaceConstraint = [NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self addConstraint:trailingSpaceConstraint];
    [self addConstraint:leadingSpaceConstraint];
    [self addConstraint:topSpaceConstraint];
    [self addConstraint:bottomSpaceConstraint];

}


- (void)didMoveToSuperview {
    [self setUpConstraints];
}



@end
