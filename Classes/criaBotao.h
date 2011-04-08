//
//  criaBotao.h
//  new
//
//  Created by iMac de Fabio Valencio on 29/10/10.
//  Copyright 2010 PontoMobi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface criaBotao : NSObject {

	UIView *viewAtual;
	UINavigationController *navigationAtual;
}

-(UIBarButtonItem* )setButton:(UIView*)myView controlador:(UINavigationController*)newNavigation;
-(IBAction) retornaHome;

@end
