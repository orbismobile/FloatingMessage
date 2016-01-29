//
//  LPFloatingMessageView.h
//  FloatingMessage
//
//  Created by Luis Perez on 25/01/16.
//  Copyright © 2016 Orbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPFloatingMessageView : UIView

@property (nonatomic, strong) NSString *message;
@property (nonatomic) BOOL loadingIndicatorEnabled;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingIndicatorView;

- (id) initWithParentView:(id)_parentView;
- (void) showMessage:(void (^)(BOOL animationFinished)) stateHandler;
- (void) hideMessageAfterDelay:(CGFloat)delay animationFinished:(void (^)(BOOL animationFinished)) stateHandler;
- (void) updateMessage:(NSString *)message animationFinished:(void (^)(BOOL animationFinished)) stateHandler loadingIndicatorEnabled:(BOOL)loadingIndicatorEnabled;
@end
