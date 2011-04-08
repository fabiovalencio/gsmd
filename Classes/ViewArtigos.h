//
//  ViewArtigos.h
//  GSMD
//
//  Created by Fabio Valencio on 11/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tabBarItem.h"
#import "Dados.h"
#import "News.h"

@interface ViewArtigos : UIViewController <UITableViewDelegate>{
	
	tabBarItem *tabbar;
	IBOutlet UITableView *table;
	Dados *artigo;
	News *artigos;
	NSMutableArray *arrayArtigos;
}

@property(nonatomic, retain) IBOutlet UITableView *table;

@end
