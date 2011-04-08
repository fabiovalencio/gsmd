//
//  ViewImprensa.m
//  GSMD
//
//  Created by Fabio Valencio on 11/03/11.
//  Copyright 2011 PontoMobi. All rights reserved.
//

#import "ViewImprensa.h"


@implementation ViewImprensa

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
	
	table.frame = CGRectMake(10, 60, 300, 320);
	table.backgroundColor = [UIColor clearColor];
	table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	
	[self.view addSubview:[functions headerTableview:@"GS&MD na Imprensa"]];
	
	btnAssessoria = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	btnAssessoria.backgroundColor = [UIColor clearColor];
	[[btnAssessoria titleLabel] setFont:[UIFont fontWithName:@"Helvetica" size:12]];
	[btnAssessoria setTitle:@"Assessoria" forState:UIControlStateNormal];
	[btnAssessoria setBackgroundImage:[UIImage imageNamed:@"buttonBackground.png"] forState:UIControlStateNormal];
	//the button should be as big as a table view cell
	[btnAssessoria setFrame:CGRectMake(210, 340, 90, 25)];
	//set action of the button
	[btnAssessoria addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchDown];
	[btnAssessoria setTag:1];
	
	
	tabbar = [[tabBarItem alloc] init];
	[tabbar setNavigation:self.navigationController setView:self.view];
	UITabBar *tabNavegacao = [tabbar constroiTabBar];
	[self.view addSubview:tabNavegacao];
	[self.view addSubview:btnAssessoria];
}


#pragma mark -
#pragma mark Private Methods

- (IBAction) didSelectButton: (id) sender
{
	assessoriaView *detailViewController = [[assessoriaView alloc] initWithNibName:@"assessoriaView" bundle:nil];
	[self.navigationController pushViewController:detailViewController animated:YES];
	[detailViewController release];
	
}


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
    return 10;
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
	cell.imageView.image  = [UIImage imageNamed:@"listImprensa.png"];
	cell.textLabel.text = @"Por que o Walmart precisa mais que descontos ";
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
    /*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
	 // ...
	 // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
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
    [super dealloc];
}


@end
