//
//  PlanetListTableViewController.m
//  SolarSystemObjC
//
//  Created by Ethan John on 2/11/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import "PlanetListTableViewController.h"
#import "EMPlanetController.h"
#import "PlanetModel.h"
#import "EMPlanetDetailViewController.h"

@interface PlanetListTableViewController ()

@end

@implementation PlanetListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
    return [[EMPlanetController planets] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"planetCell" forIndexPath:indexPath];
	
	// Subscripting & then accessing a property with [_ _] rather than a method with [[_] _]
	PlanetModel *planet = [EMPlanetController planets][[indexPath row]];
	
	cell.textLabel.text = planet.name;
	cell.detailTextLabel.text = [NSString stringWithFormat: @"Planet %@", @(indexPath.row + 1)];
	cell.imageView.image = [UIImage imageNamed: [planet imageName]];
	
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	
	if ([[segue identifier] isEqualToString:@"toDetail"])
	{
		EMPlanetDetailViewController *destinationVC = [segue destinationViewController];
		NSIndexPath *index = [[self tableView] indexPathForSelectedRow];
		PlanetModel *planetToSend = [EMPlanetController planets][index.row];
		destinationVC.planet = planetToSend;
	}
}

@end
