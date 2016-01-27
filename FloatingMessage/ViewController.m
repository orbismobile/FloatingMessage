//
//  ViewController.m
//  FloatingMessage
//
//  Created by Luis Perez on 25/01/16.
//  Copyright © 2016 Orbis. All rights reserved.
//

#import "ViewController.h"
#import "LPFloatingMessageView.h"

@interface ViewController () {
    LPFloatingMessageView *messageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated {
    [self setupFloatingMessageView];
}


- (void) setupFloatingMessageView {
    messageView = [[LPFloatingMessageView alloc] initWithParentView:self.view];
    messageView.message = @"Cargando Inmuebles";
    messageView.loadingIndicatorEnabled = YES;
}

- (IBAction)showAndHideMessage :(UIButton *)button {
    
    if ([button.titleLabel.text isEqualToString:@"Show Message"]) {
        [messageView showMessage:^(BOOL animationFinished) {        NSLog(@"Show Animation End");     }];
        [self.showMessageButton setTitle:@"Hide Message" forState:UIControlStateNormal];
    }
    else {
        [messageView hideMessage:^(BOOL animationFinished) {        NSLog(@"Hide Animation End");     }];
        [self.showMessageButton setTitle:@"Show Message" forState:UIControlStateNormal];
    }
}


- (IBAction) updateText {
    int randomNumber = arc4random_uniform(999999999) + 2;
    [messageView updateMessage:[NSString stringWithFormat:@"%i inmuebles encontrados", randomNumber] animationFinished:^(BOOL animationFinished) {
        NSLog(@"Text Update Animation End");
    } loadingIndicatorEnabled:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
