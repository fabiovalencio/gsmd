//
//  ViewDetail.m
//  GSMD
//
//  Created by iMac de Fabio Valencio on 14/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import "ViewDetail.h"
#import "functions.h"
#import "criaBotao.h"
#import "MeuWebViewViewController.h"
#import "Banner.h"


@implementation ViewDetail

@synthesize webview, titulo, _news;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

#pragma mark -
#pragma mark View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	
	UIImage *image = [UIImage imageNamed:@"btnBack.png"];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setBackgroundImage: [image stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0] forState:UIControlStateNormal];
	button.frame= CGRectMake(0.0, 0.0, image.size.width, image.size.height);
	[button addTarget:self action:@selector(backPage)    forControlEvents:UIControlEventTouchUpInside];
	
	UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, image.size.width, image.size.height) ];
	[v addSubview:button];
	
	UIBarButtonItem *forward = [[UIBarButtonItem alloc] initWithCustomView:v];
	self.navigationItem.leftBarButtonItem = forward;
	
	[v release];
	[image release];
	
	tabbar = [[tabBarItem alloc] init];
	[tabbar setNavigation:self.navigationController setView:self.view];
	UITabBar *tabNavegacao = [tabbar constroiTabBar];
	[self.view addSubview:tabNavegacao];
	
	if ([titulo isEqualToString:@"Notícias"]) {
		[webview loadHTMLString:[self fullHTML:_news.channelContent] baseURL:nil];
	} else if ([titulo isEqualToString:@"Artígos"]) {
		[webview loadHTMLString:[self fullHTML:_news.channelContent2] baseURL:nil];
	} else if ([titulo isEqualToString:@"Imprensa"]) {
		[webview loadHTMLString:[self fullHTML:_news.channelContent2] baseURL:nil];
	}
	
	Banner *myBanner = [[Banner alloc] initWithFrame:CGRectMake(0, 326, 320, 40)];
	[self.view addSubview:myBanner];
	
	[self.view addSubview:[functions headerTableview:titulo]];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[tabbar setNavigation:self.navigationController setView:self.view];
	UITabBar *tabNavegacao = [tabbar constroiTabBar];
	[self.view addSubview:tabNavegacao];
}

#pragma mark -
#pragma mark Web View

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	
	
	NSRange textRange;
	NSString *url = [NSString stringWithFormat:@"%@", request];
	textRange =[url rangeOfString:@"http://"];
	
	if(textRange.location != NSNotFound)
	 {
		 MeuWebViewViewController *detailViewController = [[MeuWebViewViewController alloc] initWithNibName:@"MeuWebViewViewController" bundle:nil];
		[detailViewController  setMyUrl:request];
		[self.navigationController pushViewController:detailViewController animated:YES];
		[detailViewController release];
		return FALSE;
	 }
	
	return true;
}

- (NSMutableString*)fullHTML:(NSString *)_html {
	NSMutableString *full = [NSMutableString string];
	
	[full appendString:@"<?xml version='1.0'?><!DOCTYPE html PUBLIC '-//WAPFORUM//DTD XHTML Mobile 1.0//EN' 'http://www.wapforum.org/DTD/xhtml-mobile10.dtd'>"];
	[full appendString:@"<html xmlns='http://www.w3.org/1999/xhtml'><head><title>Movida</title><style type='text/css'>"];
	[full appendString:@"body {padding-left: 0px; padding-top: 0px; margin-left: 10px; background-color: transparent; width: 300px; }"];
	[full appendString:@".app{font-size:8; color:#666666; font-family:TrebuchetMS}"];
	[full appendString:@"a:link{font-size:6; color:#cc3333;}"];
	[full appendString:@"</style><meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1' /></head><body><div class='app'>"];
	[full appendFormat:@"%@", _html];
	[full appendString:@"</p></body></html>"];
	//NSLog(@"html: %@", full);
	return full;
	
}

#pragma mark -
#pragma mark IBAction

- (IBAction) backPage
{
	
	NSArray *viewControllerArray = [self.navigationController viewControllers];
	int parentViewControllerIndex = [viewControllerArray count] - 2;
	[self.navigationController popToViewController: [self.navigationController.viewControllers objectAtIndex:parentViewControllerIndex] animated:YES];
	
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark -
#pragma mark Memory Manager

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
