//
//  Dados.m
//  GSMD
//
//  Created by iMac de Fabio Valencio on 14/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import "Dados.h"
#import "TBXML.h"
#import "global.h"
#import "News.h"

@interface Dados (PrivateMethods)

-(void) parseDadosXML;

@end

static Dados *sharedMyManager = nil;

@implementation Dados

@synthesize arguments;


#pragma mark Singleton Methods

+ (id)sharedManager {
	@synchronized(self) {
		if(sharedMyManager == nil)
			sharedMyManager = [[super allocWithZone:NULL] init];
	}
	return sharedMyManager;
}

+ (id)allocWithZone:(NSZone *)zone {
	return [[self sharedManager] retain];
}

- (id)copyWithZone:(NSZone *)zone {
	return self;
}

- (id)retain {
	return self;
}

- (unsigned)retainCount {
	return UINT_MAX; //denotes an object that cannot be released
}

- (void)release {
	// never release
}

- (id)autorelease {
	return self;
}

-(id) init {
	if (self = [super init]) {
		arguments = [[NSMutableArray alloc] init];
		[self parseDadosXML];
	}
	return self;
}

-(void) parseDadosXML
{


	//Generate request url
	NSMutableString* urlString = [NSMutableString stringWithString:URLDADOS];
	
	//Parser
	TBXML* tbXML = [TBXML tbxmlWithURL:[NSURL URLWithString:urlString]];
	TBXMLElement* rootElement = tbXML.rootXMLElement;
	NSString* rootElementName = [TBXML elementName:rootElement];
	
	BOOL error = (rootElement == NULL || ![rootElementName isEqualToString:@"rss"]);
	if (!error) {
		
		TBXMLElement* channel = [TBXML childElementNamed:@"schema" parentElement:rootElement];
		TBXMLElement * channelElement = [TBXML childElementNamed:@"item" parentElement:channel];
		while (channelElement) {
			News* channel = [[News alloc] init];
			TBXMLElement* element;
			
			element = [TBXML childElementNamed:@"author" parentElement:channelElement];
			channel.channelAuthor = [TBXML textForElement:element];
			
			element = [TBXML childElementNamed:@"content" parentElement:channelElement];
			channel.channelContent = [TBXML textForElement:element];
			
			element = [TBXML childElementNamed:@"content2" parentElement:channelElement];
			channel.channelContent2 = [TBXML textForElement:element];
			
			element = [TBXML childElementNamed:@"editoria" parentElement:channelElement];
			channel.channelEditoria = [TBXML textForElement:element];
			
			element = [TBXML childElementNamed:@"news" parentElement:channelElement];
			channel.channelNews = [TBXML textForElement:element];
			
			element = [TBXML childElementNamed:@"permalink" parentElement:channelElement];
			channel.channelPermalink = [TBXML textForElement:element];
			
			element = [TBXML childElementNamed:@"title" parentElement:channelElement];
			channel.channelTitle = [TBXML textForElement:element];
			
			element = [TBXML childElementNamed:@"subject" parentElement:channelElement];
			channel.channelSubject = [TBXML textForElement:element];
			
			element = [TBXML childElementNamed:@"image" parentElement:channelElement];
			channel.channelImage = [TBXML textForElement:element];
			
			channelElement = channelElement->nextSibling;
			
			[arguments addObject:channel];
			[channel release];
		}
		
		
		//[self requestOperationFinishedWithSuccess:_requestOperationType withArguments:arguments];
	} else {
		News* error = nil;
		arguments = nil;
		News* channel = [[News alloc] init];
		
		if ([rootElementName isEqualToString:@"error"]) {
			channel.error = @"Não foi possível ler os dados, tente novamente mais tarde";
		}
		if (error) {
			[arguments addObject:channel];
		}
		//[self requestOperationFinishedWithError:_requestOperationType withArguments:arguments];
	}
	
	//NSLog(@"Dados: %@", arguments);
}

-(void) parseErrorElement
{
	
}
@end
