//
//  UIViewController+Loading.m
//  GNTModa2
//
//  Created by Marcelo Queiroz on 1/14/11.
//  Copyright 2011 MobMidia. All rights reserved.
//

#import "UIViewController+Loading.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewController (Loading)

- (void) showLoadingScreenWithFrame: (CGRect) loadingFrame {
	if (_loadingView) {
		return;
	}
	
	//Load loading view
	_loadingView = [[UIView alloc] initWithFrame:loadingFrame];
	_loadingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
	_loadingView.layer.borderColor = [UIColor whiteColor].CGColor;
	
	//Load activity view
	UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[activity startAnimating];
	activity.center = CGPointMake(_loadingView.frame.size.width/2, _loadingView.frame.size.height/2);
	[_loadingView addSubview:activity];
	[activity release];
	
	//Add loading view
	[self.view addSubview:_loadingView];
}

- (void) showRoundedBoxLoadingViewWithMessage: (NSString*) message {
	if (_loadingView) {
		return;
	}
	
	//Load loading view
	_loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
	_loadingView.center = CGPointMake(self.view.center.x, self.view.center.y);
	_loadingView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
	
	//Setup border
	_loadingView.layer.borderWidth = 3.0;
	_loadingView.layer.borderColor = [UIColor whiteColor].CGColor;
	_loadingView.layer.cornerRadius = 10.0;
	
	//Label
	UILabel* lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 35)];
	lbl.center = CGPointMake(90, 125);
	lbl.backgroundColor = [UIColor clearColor];
	lbl.textAlignment = UITextAlignmentCenter;
	lbl.textColor = [UIColor whiteColor];
	lbl.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
	lbl.numberOfLines = 2;
	lbl.text = message;
	[_loadingView addSubview:lbl];
	[lbl release];
	
	//Load activity view
	UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[activity startAnimating];
	activity.center = CGPointMake(_loadingView.frame.size.width/2, (_loadingView.frame.size.height/2) - 10);
	[_loadingView addSubview:activity];
	[activity release];
	
	//Add loading view
	[self.view addSubview:_loadingView];
}

- (void) dismissLoadingScreen {
	if (_loadingView) {
		[_loadingView removeFromSuperview];
		[_loadingView release];
		_loadingView = nil;	
	}
}


@end
