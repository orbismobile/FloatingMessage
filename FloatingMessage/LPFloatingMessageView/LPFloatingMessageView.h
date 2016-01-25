//
//  LPFloatingMessageView.h
//  FloatingMessage
//
//  Created by Luis Perez on 25/01/16.
//  Copyright © 2016 Orbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPFloatingMessageView : UIView

@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) NSString *message;

- (void) setUpConstraints;

@end
