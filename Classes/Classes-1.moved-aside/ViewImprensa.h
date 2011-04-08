//
//  ViewImprensa.h
//  GSMD
//
//  Created by Fabio Valencio on 11/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tabBarItem.h"


@interface ViewImprensa : UIViewController <UITableViewDelegate>{
	
	tabBarItem *tabbar;
	IBOutlet UITableView *table;
	UIButton *btnAssessoria;
	
}

@property(nonatomic, retain) IBOutlet UITableView *table;


- (IBAction) didSelectButton: (id) sender;
