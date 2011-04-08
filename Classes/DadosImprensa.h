//
//  DadosImprensa.h
//  GSMD
//
//  Created by iMac de Fabio Valencio on 01/04/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DadosImprensa : NSObject {

	NSMutableArray *arguments;
}

@property (nonatomic, retain) NSMutableArray *arguments;


+ (id)sharedManager;

@end
