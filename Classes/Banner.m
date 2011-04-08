//
//  Banner.m
//  GSMD
//
//  Created by iMac de Fabio Valencio on 15/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import "Banner.h"


@implementation Banner


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"publicidade.png"]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
