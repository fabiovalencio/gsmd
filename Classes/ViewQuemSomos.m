//
//  ViewQuemSomos.m
//  GSMD
//
//  Created by Fabio Valencio on 11/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import "ViewQuemSomos.h"
#import "functions.h"
#import "criaBotao.h"
#import "Banner.h"

@implementation ViewQuemSomos

@synthesize scrollview;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
    criaBotao *_criaBotao = [[criaBotao alloc] init];
	UIBarButtonItem *BotaoHome = [_criaBotao setButton:self.view controlador:self.navigationController];
	self.navigationItem.leftBarButtonItem = BotaoHome;
	
	tabbar = [[tabBarItem alloc] init];
	[tabbar setNavigation:self.navigationController setView:self.view];
	UITabBar *tabNavegacao = [tabbar constroiTabBar];
	[self.view addSubview:tabNavegacao];
	
	[self.view addSubview:tabNavegacao];
	scrollview.contentSize = CGSizeMake(320, 2400);
	[self.view addSubview:[functions headerTableview:@"Quem somos" subTitle:@""]];
	
	Banner *myBanner = [[Banner alloc] initWithFrame:CGRectMake(0, 326, 320, 40)];
	[self.view addSubview:myBanner];
}


/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[scrollview release];
    [super dealloc];
}


@end