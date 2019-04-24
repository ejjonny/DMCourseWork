//
//  EMPlanetDetailViewController.m
//  SolarSystemObjC
//
//  Created by Ethan John on 2/11/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import "EMPlanetDetailViewController.h"
#import "PlanetModel.h"

@interface EMPlanetDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *planetImageView;
@property (weak, nonatomic) IBOutlet UILabel *diameterLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceFromSunLabel;

@end

@implementation EMPlanetDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self updateWithPlanet: self.planet];
}

-(void)updateWithPlanet:(PlanetModel *)planet
{
	self.title = planet.name;
	self.planetImageView.image = [UIImage imageNamed: planet.imageName];
	self.diameterLabel.text = [NSString stringWithFormat:@"%@", @(planet.diameter)];
	self.distanceFromSunLabel.text = [NSString stringWithFormat:@"%@", @(planet.millionKMsFromSun)];
	self.dayLengthLabel.text = [NSString stringWithFormat:@"%@ hours", @(planet.dayLength)];
}

@end
