//
//  ViewController.m
//  FloatingMessage
//
//  Created by Luis Perez on 25/01/16.
//  Copyright © 2016 Orbis. All rights reserved.
//

#import "ViewController.h"
#import "LPFloatingMessageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)showMessage {
    LPFloatingMessageView *messageView = [[LPFloatingMessageView alloc] init];
    messageView.message = @"Soy un mensaje";
    [self.view addSubview:messageView];
    
    
    
}



/*
 NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:messageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
 [self.view addConstraint:centerYConstraint];
 
 // Center Horizontally
 NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:messageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
 [self.view addConstraint:centerXConstraint];
 
 
 NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:messageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0];
 [messageView addConstraint:heightConstraint];
 
 NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:messageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0];
 [messageView addConstraint:widthConstraint];
 
 [self.view addConstraint:centerXConstraint];
 [messageView addConstraint:heightConstraint];
 [messageView addConstraint:widthConstraint];
 
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
