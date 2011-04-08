//
//  RootViewController.m
//  GSMD
//
//  Created by Fabio Valencio on 11/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import "RootViewController.h"
#import "OHAttributedLabel.h"
#import "ViewNoticias.h"
#import "ViewArtigos.h"
#import "ViewImprensa.h"
#import "ViewTalentos.h"
#import "ViewQuemSomos.h"
#import "MeuWebViewViewController.h"
#import "GSMDAppDelegate.h"
#import "tabBarItem.h"
#import "global.h"
#import "Dados.h"
#import "DadosImprensa.h"


@implementation RootViewController

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[Dados sharedManager];
	[DadosImprensa sharedManager];
	
	self.title = @"";
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	
	arrayController = [[NSMutableArray alloc] init];
	//OHLABEL
	OHAttributedLabel* myAttributedLabel = [[OHAttributedLabel alloc] initWithFrame:CGRectMake(153, 121, 155, 21)];
	//myAttributedLabel.center = CGPointMake(160, 115);
	NSMutableAttributedString* attrStr = [NSMutableAttributedString attributedStringWithString:@"Mercado & Consumo"];
	[attrStr setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:16]];
	//[attrStr setFontFamily:@"TrebuchetMS" size:18 bold:YES italic:NO range:NSMakeRange(8, 1)];
	[attrStr setTextColor:[UIColor redColor] range:NSMakeRange(8, 1)];
	[attrStr setTextColor:[UIColor colorWithRed:0.0 /255 green:51.0 / 255 blue:102.0 / 255 alpha:1] range:NSMakeRange(0, 7)];
	[attrStr setTextColor:[UIColor colorWithRed:0.0 /255 green:51.0 / 255 blue:102.0 / 255 alpha:1] range:NSMakeRange(10, 7)];
	myAttributedLabel.attributedText = attrStr;
	[self.view addSubview:myAttributedLabel];
	splashImage.hidden = YES;
}

-(void) viewDidAppear:(BOOL)animated{
	[self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void) viewWillAppear:(BOOL)animated{
	[self.navigationController setNavigationBarHidden:YES animated:YES];
}
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

-(IBAction) clickButton:(id) sender
{
	
	tagButton = [sender tag];
	[self.navigationController setNavigationBarHidden:NO animated:YES];

	if ([sender tag] == 0) {
		ViewNoticias *detailViewController = [[ViewNoticias alloc] initWithNibName:@"ViewNoticias" bundle:Nil];
		[self.navigationController pushViewController:detailViewController animated:YES];
		[detailViewController release];
	} else if ([sender tag] == 1) {
		ViewArtigos *detailViewController = [[ViewArtigos alloc] initWithNibName:@"ViewArtigos" bundle:nil];
		[self.navigationController pushViewController:detailViewController animated:YES];
		[detailViewController release];
	} else if ([sender tag] == 2) {
		ViewImprensa *detailViewController = [[ViewImprensa alloc] initWithNibName:@"ViewImprensa" bundle:nil];
		[self.navigationController pushViewController:detailViewController animated:YES];
		[detailViewController release];
	} else if ([sender tag] == 3) {
		ViewTalentos *detailViewController = [[ViewTalentos alloc] initWithNibName:@"ViewTalentos" bundle:nil];
		[self.navigationController pushViewController:detailViewController animated:YES];
		[detailViewController release];
	} else if ([sender tag] == 4) {
		ViewQuemSomos *detailViewController = [[ViewQuemSomos alloc] initWithNibName:@"ViewQuemSomos" bundle:nil];
		[self.navigationController pushViewController:detailViewController animated:YES];
		[detailViewController release];
	} else if ([sender tag] == 5) {
		MeuWebViewViewController *detailViewController = [[MeuWebViewViewController alloc] initWithNibName:@"MeuWebViewViewController" bundle:nil];
		NSURL *url = [NSURL URLWithString:@"http://m.facebook.com/profile.php?id=100001280427366&sk=wall"];
		NSURLRequest *myUrl = [[NSURLRequest alloc] initWithURL:url];
		[detailViewController  setMyUrl:myUrl];
		[self.navigationController pushViewController:detailViewController animated:YES];
		[detailViewController release];
		[myUrl release];
	} else if ([sender tag] == 6) {
		MeuWebViewViewController *detailViewController = [[MeuWebViewViewController alloc] initWithNibName:@"MeuWebViewViewController" bundle:nil];
		NSURL *url = [NSURL URLWithString:@"http://mobile.twitter.com/gsmdgouvea"];
		NSURLRequest *myUrl = [[NSURLRequest alloc] initWithURL:url];
		[detailViewController  setMyUrl:myUrl];
		[self.navigationController pushViewController:detailViewController animated:YES];
		[detailViewController release];
		[myUrl release];
	}
}

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
