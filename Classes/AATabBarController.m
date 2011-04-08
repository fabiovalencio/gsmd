//
//  AATabBarController.m
//  CustomTab
//
//  Created by Jeff Hodnett on 13/11/2010.
//  Copyright 2010 Applausible. All rights reserved.
//

#import "AATabBarController.h"
#import "UITabBar+ColorExtensions.h"

@implementation AATabBarController

- (void)viewDidLoad {
	[super viewDidLoad];

	// Put in a background
	CGRect frame = CGRectMake(0.0, 0, self.view.bounds.size.width, 48);
	backgroundView = [[UIView alloc] initWithFrame:frame];
	
	[backgroundView setBackgroundColor:[UIColor colorWithRed:0.0
												 green:0.0
												  blue:0.0
												 alpha:0.1]];
	[self.tabBar insertSubview:backgroundView atIndex:0];
}

-(void)dealloc {
	[backgroundView release];
	
	[super dealloc];
}

-(void)updateTabColor:(UIColor *)color {
	// Recolor the tab bar
	[self.tabBar recolorItemsWithColor:color shadowColor:[UIColor blackColor] shadowOffset:CGSizeMake(0.0f, -1.0f) shadowBlur:3.0f]; 
}

-(void)updateBackgroundColor:(UIColor *)color {
	// Update the background color
	[backgroundView setBackgroundColor:color];
}

@end
