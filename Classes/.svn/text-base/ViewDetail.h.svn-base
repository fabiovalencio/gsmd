//
//  ViewDetail.h
//  GSMD
//
//  Created by iMac de Fabio Valencio on 14/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tabBarItem.h"
#import "News.h"

@interface ViewDetail : UIViewController {

	tabBarItem *tabbar;
	NSString *titulo;
	News *_news;
	IBOutlet UIWebView *webview;
	
}

@property(nonatomic, retain) IBOutlet UIWebView *webview;
@property(nonatomic, retain) NSString *titulo;
@property(nonatomic, retain) News *_news;

- (NSMutableString*)fullHTML:(NSString *)_html;

@end
