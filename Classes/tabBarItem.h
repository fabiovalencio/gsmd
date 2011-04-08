//
//  tabBarItem.h
//  new
//
//  Created by iMac de Fabio Valencio on 27/10/10.
//  Copyright 2010 PontoMobi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface tabBarItem : UIView <UIApplicationDelegate, UITabBarDelegate, UITabBarControllerDelegate> {

	UITabBar *tabBarView;
	UITabBarItem *btNoticias;
	UITabBarItem *btArtigos;
	UITabBarItem *btImprensa;
	UITabBarItem *btTalentos;
	UITabBarItem *btSomos;
	UINavigationController *meuNavigationController, *navigationController;
	UIView *meuView;
	BOOL ativo;
	
}

@property (nonatomic, retain) UITabBar *tabBarView;

- (UITabBar*) constroiTabBar;
-(void) setNavigation:(UINavigationController *)controller setView:(UIView *)view;
-(void) telaAtiva:(int)index;
@end
