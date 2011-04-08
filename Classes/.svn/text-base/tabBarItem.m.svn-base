//
//  tabBarItem.m
//  new
//
//  Created by iMac de Fabio Valencio on 27/10/10.
//  Copyright 2010 PontoMobi. All rights reserved.
//

#import "RootViewController.h"
#import "tabBarItem.h"
#import "UITabBar+ColorExtensions.h"
#import "ViewNoticias.h"
#import "ViewArtigos.h"
#import "ViewImprensa.h"
#import "ViewTalentos.h"
#import "ViewQuemSomos.h"
#import "global.h"

@implementation tabBarItem

@synthesize tabBarView;

- (UITabBar*) constroiTabBar{
	
	CGRect tabBarRect = CGRectMake(0, 366, 320, 50);
	UITabBar *myTabBar = [[UITabBar alloc] initWithFrame:tabBarRect];
	tabBarView = myTabBar;
	tabBarView.delegate = self;
	
	//TabBar Buttons
	btNoticias = [[UITabBarItem alloc] initWithTitle:@"Notícias" image:[UIImage imageNamed:@"iconNoticias.png"] tag:0];
	btArtigos = [[UITabBarItem alloc] initWithTitle:@"Artígos" image:[UIImage imageNamed:@"iconArtigos.png"] tag:1];
	btImprensa = [[UITabBarItem alloc] initWithTitle:@"Imprensa" image:[UIImage imageNamed:@"iconImprensa.png"] tag:2];
	btTalentos = [[UITabBarItem alloc] initWithTitle:@"Talentos" image:[UIImage imageNamed:@"iconTalentos.png"] tag:3];
	btSomos = [[UITabBarItem alloc] initWithTitle:@"Quem somos" image:[UIImage imageNamed:@"iconSomos.png"] tag:4];
	// Collect the items in a temporary array.
	NSArray *items = [NSArray arrayWithObjects:btNoticias, btArtigos, btImprensa, btTalentos, btSomos, nil];
	
	// Pass the items to the toolbar.
	[tabBarView  setItems:items];
	[self telaAtiva:tagButton];
	
	[tabBarView recolorItemsWithColor:[UIColor redColor] shadowColor:[UIColor blackColor] shadowOffset:CGSizeMake(0.0f, -1.0f) shadowBlur:3.0f];
	
	 return tabBarView;
}

- (void) tabBar: (UITabBar *) tabBar didSelectItem: (UITabBarItem *) item{

	tabBarView.selectedItem = item;
	int Tag = item.tag;

	if (tagButton != Tag) {
		
		tagButton =  Tag;
		ViewNoticias *viewNoticias = [[ViewNoticias alloc] initWithNibName:@"ViewNoticias" bundle:[NSBundle mainBundle]];
		ViewArtigos *viewArtigos = [[ViewArtigos alloc] initWithNibName:@"ViewArtigos" bundle:[NSBundle mainBundle]];
		ViewImprensa *viewImprensa = [[ViewImprensa alloc] initWithNibName:@"ViewImprensa" bundle:[NSBundle mainBundle]];
		ViewTalentos *viewTalentos = [[ViewTalentos alloc] initWithNibName:@"ViewTalentos" bundle:[NSBundle mainBundle]];
		ViewQuemSomos *viewSomos = [[ViewQuemSomos alloc] initWithNibName:@"ViewQuemSomos" bundle:[NSBundle mainBundle]];
		
		
		switch (item.tag) {
			case 0:

				navigationController = [[UINavigationController alloc] initWithRootViewController:viewNoticias ];

				break;
			case 1:
				
				navigationController = [[UINavigationController alloc] initWithRootViewController:viewArtigos ];

				break;
			case 2:
				
				navigationController = [[UINavigationController alloc] initWithRootViewController:viewImprensa ];

				break;
			case 3:
				
				navigationController = [[UINavigationController alloc] initWithRootViewController:viewTalentos ];

				break;
			case 4:
				
				navigationController = [[UINavigationController alloc] initWithRootViewController:viewSomos ];

				break;
			default:
				break;
		}
		
		ativo = TRUE;
		[navigationController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
		[meuNavigationController presentModalViewController:navigationController animated:YES];
		[navigationController release];
		
		[viewNoticias release];
		[viewArtigos release];
		[viewImprensa release];
		[viewTalentos release];
		[viewSomos release];
	}
	
	
	
}

-(void) telaAtiva:(int)index
{
	//tagButton = index;
	if (index == 0) {
		tabBarView.selectedItem = btNoticias;
	} else if (index == 1) {
		tabBarView.selectedItem = btArtigos;
	} else if (index == 2) {
		tabBarView.selectedItem = btImprensa;
	} else if (index == 3) {
		tabBarView.selectedItem = btTalentos;
	} else if (index == 4) {
		tabBarView.selectedItem = btSomos;
	}
	
}

-(void) setNavigation:(UINavigationController *)controller setView:(UIView *)view;
{
	
	meuNavigationController = controller;
	meuView = view;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
