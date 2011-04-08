//
//  ViewImprensa.h
//  GSMD
//
//  Created by Fabio Valencio on 11/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tabBarItem.h"
#import "DadosImprensa.h"
#import "News.h"

@interface ViewImprensa : UIViewController <UITableViewDelegate, UINavigationControllerDelegate>{

	tabBarItem *tabbar;
	IBOutlet UITableView *table;
	UIButton *btnAssessoria;
	DadosImprensa *noticia;
	News *noticias;
	NSMutableArray *arrayImprensa;
}

@property(nonatomic, retain) IBOutlet UITableView *table;

- (IBAction) didSelectButton: (id) sender;

@end
