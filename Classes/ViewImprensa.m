//
//  ViewImprensa.m
//  GSMD
//
//  Created by Fabio Valencio on 11/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import "ViewImprensa.h"
#import "functions.h"
#import "ViewAssessoria.h"
#import "criaBotao.h"
#import "global.h"
#import "Banner.h"
#import "ViewDetail.h"

@implementation ViewImprensa

@synthesize table;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	criaBotao *_criaBotao = [[criaBotao alloc] init];
	UIBarButtonItem *BotaoHome = [_criaBotao setButton:self.view controlador:self.navigationController];
	self.navigationItem.leftBarButtonItem = BotaoHome;
	
	table.frame = CGRectMake(10, 60, 300, 280);
	table.backgroundColor = [UIColor clearColor];
	table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	
	[self.view addSubview:[functions headerTableview:@"GS&MD na Imprensa"]];
	
	
	btnAssessoria = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	btnAssessoria.backgroundColor = [UIColor clearColor];
	[[btnAssessoria titleLabel] setFont:[UIFont fontWithName:@"Helvetica" size:12]];
	[btnAssessoria setTitle:@"Assessoria" forState:UIControlStateNormal];
	[btnAssessoria setBackgroundImage:[UIImage imageNamed:@"buttonBackground.png"] forState:UIControlStateNormal];
	//the button should be as big as a table view cell
	[btnAssessoria setFrame:CGRectMake(220, 300, 90, 25)];
	//set action of the button
	[btnAssessoria addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchDown];
	[btnAssessoria setTag:1];
	
	tabbar = [[tabBarItem alloc] init];
	[tabbar setNavigation:self.navigationController setView:self.view];
	UITabBar *tabNavegacao = [tabbar constroiTabBar];
	[self.view addSubview:tabNavegacao];
	
	noticia = [DadosImprensa sharedManager];
	
	arrayImprensa = [[NSMutableArray alloc] init];
	
	[self.view addSubview:btnAssessoria];
	
	Banner *myBanner = [[Banner alloc] initWithFrame:CGRectMake(0, 326, 320, 40)];
	[self.view addSubview:myBanner];
	
}

- (IBAction) didSelectButton: (id) sender
{
	ViewAssessoria *detailViewController = [[ViewAssessoria alloc] initWithNibName:@"ViewAssessoria" bundle:nil];
	[self.navigationController pushViewController:detailViewController animated:YES];
	[detailViewController release];
	
}


 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
	 
	 [tabbar setNavigation:self.navigationController setView:self.view];
	 UITabBar *tabNavegacao = [tabbar constroiTabBar];
	 [self.view addSubview:tabNavegacao];
 }

/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


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
		if (![noticias.channelTitle isEqualToString:@""]) {
			line += 1;
			[arrayImprensa addObject:noticia];
			
		}
	}
    return line;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *SectionsTableIdentifier = @"SectionTableIdentifier";
    
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:SectionsTableIdentifier];
    if (cell == nil) {
		
		// MUDAR TIPO DE CELULA PARA MOSTRAR SUB-TITULO
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SectionsTableIdentifier] autorelease];
    }
	
	// Configure the cell...
	
	cell.textLabel.text = noticias.channelTitle;
	// Configure the cell...
	//cell.textLabel.text = imprensaArray.channelTitle;
	cell.imageView.image  = [UIImage imageNamed:@"listImprensa.png"];
	cell.textLabel.font = [UIFont fontWithName:@"TrebuchetMS" size:11];
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
	return 35.0;
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
	
	[detailViewController setTitulo:@"Imprensa"];
	[detailViewController set_news: noticias];
	[self.navigationController pushViewController:detailViewController animated:YES];
	[detailViewController release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[table release];
    [super dealloc];
}


@end
