//
//  ViewNoticias.m
//  GSMD
//
//  Created by Fabio Valencio on 11/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import "ViewNoticias.h"
#import "functions.h"
#import "criaBotao.h"
#import "ViewDetail.h"
#import "Banner.h"
#import "global.h"

@implementation ViewNoticias

@synthesize table;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	criaBotao *_criaBotao = [[criaBotao alloc] init];
	UIBarButtonItem *BotaoHome = [_criaBotao setButton:self.view controlador:self.navigationController];
	self.navigationItem.leftBarButtonItem = BotaoHome;
	
	//table = [[UITableView alloc] initWithFrame:CGRectMake(20, 0, 280, 300) style: UITableViewStylePlain];
	table.frame = CGRectMake(10, 60, 300, 310);
	table.backgroundColor = [UIColor clearColor];
	table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	
	tagButton = 0;
	tabbar = [[tabBarItem alloc] init];
	[tabbar setNavigation:self.navigationController setView:self.view];
	UITabBar *tabNavegacao = [tabbar constroiTabBar];
	[self.view addSubview:tabNavegacao];
	
	[self.view addSubview:[functions headerTableview:@"Notícias"]];
	
	noticia = [Dados sharedManager];

	arrayNoticias = [[NSMutableArray alloc] init];
	
	Banner *myBanner = [[Banner alloc] initWithFrame:CGRectMake(0, 326, 320, 40)];
	[self.view addSubview:myBanner];
}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[tabbar setNavigation:self.navigationController setView:self.view];
	UITabBar *tabNavegacao = [tabbar constroiTabBar];
	[self.view addSubview:tabNavegacao];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	int line = 0;
	for (int i = 0; i < [noticia.arguments count]; i++) {
		noticias = [noticia.arguments objectAtIndex:i];
		if (![noticias.channelNews isEqualToString:@""]) {
			line += 1;
			[arrayNoticias addObject:noticias];
		}
	}
    return line;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *SectionsTableIdentifier = @"SectionTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier];
    if (cell == nil) {
		
		// MUDAR TIPO DE CELULA PARA MOSTRAR SUB-TITULO
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SectionsTableIdentifier] autorelease];
    }
	
	News * noticiasArray = [arrayNoticias objectAtIndex:indexPath.row];
	// Configure the cell...

	cell.imageView.image  = [UIImage imageNamed:@"listNoticias.png"];
	cell.textLabel.text = noticiasArray.channelNews;
	cell.textLabel.numberOfLines = 2;
	cell.textLabel.font = [UIFont fontWithName:@"TrebuchetMS" size:12];
	cell.textLabel.textColor = [UIColor colorWithRed:102.0 /255 green:102.0 / 255 blue:102.0 / 255 alpha:1];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.selectionStyle = UITableViewCellSelectionStyleGray;
	cell.textLabel.highlightedTextColor = [UIColor whiteColor];


	
    return cell;
}

- (void) tableView:(UITableView *)table willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if(indexPath.row%2==0){
		cell.backgroundColor = COLOR_CELL_2;
	} else {
		cell.backgroundColor = COLOR_CELL_1;
	}
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 55.0;
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    [table deselectRowAtIndexPath:indexPath animated:YES];
	 ViewDetail *detailViewController = [[ViewDetail alloc] initWithNibName:@"ViewDetail" bundle:nil];
	 
	[detailViewController setTitulo:@"Notícias"];
	[detailViewController set_news:[arrayNoticias objectAtIndex:indexPath.row]];
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[table release];
    [super dealloc];
}


@end
