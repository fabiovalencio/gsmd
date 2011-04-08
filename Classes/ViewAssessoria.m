//
//  ViewAssessoria.m
//  GSMD
//
//  Created by Fabio Valencio on 11/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import "ViewAssessoria.h"
#import "functions.h"
#import "criaBotao.h"
#import "Banner.h"

@implementation ViewAssessoria

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
	
	[self.view addSubview:[functions headerTableview:@"Assessoria"]];
	
	Banner *myBanner = [[Banner alloc] initWithFrame:CGRectMake(0, 326, 320, 40)];
	[self.view addSubview:myBanner];

}


#pragma mark -
#pragma mark IBAction

- (IBAction) backPage
{

	NSArray *viewControllerArray = [self.navigationController viewControllers];
	int parentViewControllerIndex = [viewControllerArray count] - 2;
	[self.navigationController popToViewController: [self.navigationController.viewControllers objectAtIndex:parentViewControllerIndex] animated:YES];
	
}

- (IBAction) callFoneEmail:(id) sender
{

	if (![sender tag] == 0) {
		// Verificar se aparelho envia email
		if ([MFMailComposeViewController canSendMail]){
			// Inicializar objeto de email
			MFMailComposeViewController* emailController = [[MFMailComposeViewController alloc] init];
			// Setar o delegate 
			emailController.mailComposeDelegate = self;
			NSString *email = [(UIButton *)sender currentTitle];
			[emailController setToRecipients:[NSArray arrayWithObjects:email,nil]];
			[emailController setMessageBody:@"" isHTML:NO];
			[emailController setSubject:@"Contato GS&MD via iPhone"];
		
			[self presentModalViewController:emailController animated:YES];
			
			[[emailController navigationBar] setTintColor:[UIColor clearColor]];
			UIImage *image = [UIImage imageNamed: @"logo.png"];
			UIImageView * iv = [[UIImageView alloc] init];
			iv.image = image;
			iv.contentMode = UIViewContentModeCenter;
			[[[emailController viewControllers] lastObject] navigationItem].titleView = iv;
			[[emailController navigationBar] sendSubviewToBack:iv];
			[iv release];

			[emailController release];
		}
	} else {
		
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://01155058922"]];
		
	}

}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self dismissModalViewControllerAnimated:YES];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
