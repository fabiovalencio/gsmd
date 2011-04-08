//
//  UIViewController+Loading.h
//  GNTModa2
//
//  Created by Marcelo Queiroz on 1/14/11.
//  Copyright 2011 MobMidia. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIViewController (Loading)

UIView* _loadingView;
- (void) showLoadingScreenWithFrame: (CGRect) loadingFrame;
- (void) dismissLoadingScreen;
- (void) showRoundedBoxLoadingViewWithMessage: (NSString*) message;
@end
