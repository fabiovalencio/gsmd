//
//  functions.m
//  newTabbar
//
//  Created by iMac de Fabio Valencio on 02/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import "functions.h"
#import "OHAttributedLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation functions


+(UIView*) createHeaderTitle:(double)_x y:(double)_y width:(double)_width height:(double)_height
{
	
	
	//view com dados do topo
	UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(_x, _y, _width, _height)] autorelease];
	
	UILabel *myLabelBack = [[UILabel alloc] initWithFrame:CGRectMake(_x, _y, _width, _height)];
	myLabelBack.backgroundColor = [UIColor whiteColor];
	
	//OHLABEL
	OHAttributedLabel* myAttributedLabel = [[OHAttributedLabel alloc] initWithFrame:CGRectMake(10, 10, 320, 25)];
	//myAttributedLabel.center = CGPointMake(160, 115);
	NSMutableAttributedString* attrStr = [NSMutableAttributedString attributedStringWithString:@"Mercado & Consumo"];
	[attrStr setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:16]];
	//[attrStr setFontFamily:@"TrebuchetMS" size:18 bold:YES italic:NO range:NSMakeRange(8, 1)];
	[attrStr setTextColor:[UIColor redColor] range:NSMakeRange(8, 1)];
	[attrStr setTextColor:[UIColor colorWithRed:0.0 /255 green:51.0 / 255 blue:102.0 / 255 alpha:1] range:NSMakeRange(0, 7)];
	[attrStr setTextColor:[UIColor colorWithRed:0.0 /255 green:51.0 / 255 blue:102.0 / 255 alpha:1] range:NSMakeRange(10, 7)];
	myAttributedLabel.attributedText = attrStr;
	
	[headerView addSubview:myLabelBack];
	[headerView addSubview:myAttributedLabel];
	
	[myLabelBack release];
	[myAttributedLabel release];
	
	return headerView;

}

+(UIView*) headerTableview:(NSString *)_title
{
	
	UIView *myView = [self createHeaderTitle:0.0 y:0.0 width:320.0 height:65.0];
	
	UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 320, 25)];
	myLabel.text = _title;
	[myLabel setFont:[UIFont fontWithName:@"TrebuchetMS" size:16]];
	[myLabel setTextColor:[UIColor redColor]];
	
	UIImageView *myBorder = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lineSolid.png"]];
	myBorder.frame = CGRectMake(10, 64, 300, 1);
	
	[myView addSubview:myLabel];
	[myView addSubview:myBorder];
	
	[myLabel release];
	[myBorder release];
	
	return myView;
	
}

+(UIView*) headerTableview:(NSString *)_title subTitle:(NSString*)_subtitle
{
	
	UIView *myView = [functions createHeaderTitle:0 y:0 width:320 height:80];
	
	UILabel *myTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 320, 25)];
	myTitle.text = _title;
	[myTitle setFont:[UIFont fontWithName:@"TrebuchetMS" size:16]];
	[myTitle setTextColor:[UIColor redColor]];
	
	UILabel *mySubTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 320, 20)];
	mySubTitle.text = _subtitle;
	[mySubTitle setFont:[UIFont fontWithName:@"TrebuchetMS" size:12]];
	[mySubTitle setTextColor:[UIColor blackColor]];
	
	
	UIImageView *myBorder = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lineDotted.png"]];
	myBorder.frame = CGRectMake(10, 75, 300, 11);
	
	[myView addSubview:myTitle];
	[myView addSubview:myBorder];
	[myView addSubview:mySubTitle];
	
	
	[myTitle release];
	[mySubTitle release];
	[myBorder release];
	
	return myView;
	
}

@end
