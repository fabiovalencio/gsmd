//
//  criaBotao.m
//  new
//
//  Created by iMac de Fabio Valencio on 29/10/10.
//  Copyright 2010 PontoMobi. All rights reserved.
//

#import "criaBotao.h"
#import "RootViewController.h"
#import "GSMDAppDelegate.h"
#import "global.h"

@implementation criaBotao


-(UIBarButtonItem* )setButton:(UIView*)myView controlador:(UINavigationController*)newNavigation
{
	
	viewAtual = myView;
	navigationAtual = newNavigation;
	[arrayController addObject:newNavigation];
	
	///////////////////////////////////////////////////////
	UIImage *image = [UIImage imageNamed:@"btnBack.png"];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	
	UILabel *TituloLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 250, 20)];
	TituloLabel.text = @" ";
	TituloLabel.font = [UIFont boldSystemFontOfSize:13];
	TituloLabel.backgroundColor = [UIColor clearColor];
	TituloLabel.textColor = [UIColor whiteColor];
	[button addSubview:TituloLabel];
	
	
	[button setBackgroundImage: [image stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0] forState:UIControlStateNormal];
	//[button setBackgroundImage: [[UIImage imageNamed: @"btnBack.png"] stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0] forState:UIControlStateHighlighted];
	button.frame= CGRectMake(0.0, 0.0, image.size.width, image.size.height);
	[button addTarget:self action:@selector(retornaHome)    forControlEvents:UIControlEventTouchUpInside];
	
	UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, image.size.width, image.size.height) ];
	[v addSubview:button];
	
	UIBarButtonItem *forward = [[UIBarButtonItem alloc] initWithCustomView:v];
	
	
	return forward;
	
	[v release];
	[image release];
	[TituloLabel release];
	//////////////////////////////////////////////////////
}

-(IBAction) retornaHome
{
	
	UINavigationController *myNavigation = [[UINavigationController alloc] init];
	myNavigation = [arrayController objectAtIndex:0];
	
	//remove all subview
	for (UIView *view in viewAtual.subviews) {
		[view removeFromSuperview];
	}
		
	RootViewController *rootHome = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
	UINavigationController *rootNavigation = [[UINavigationController alloc] initWithRootViewController:rootHome ];
	[rootNavigation setModalTransitionStyle:UIModalTransitionStyleCoverVertical];

	[navigationAtual presentModalViewController:rootNavigation animated:YES];
	[rootNavigation release];
	[rootHome release];
	
	/*
	RootViewController *rootHome = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:[NSBundle mainBundle]];
	NSLog(@"View Controllers : %@",myNavigation.viewControllers);
	[navigationAtual popToViewController:[myNavigation.viewControllers objectAtIndex:1] animated:YES];
	 */
	[myNavigation release];
}

@end
