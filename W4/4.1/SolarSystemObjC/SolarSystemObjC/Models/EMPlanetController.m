//
//  EMPlanetController.m
//  SolarSystemObjC
//
//  Created by Ethan John on 2/11/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import "EMPlanetController.h"
#import "PlanetModel.h"

@implementation EMPlanetController

+ (NSArray *)planets
{
	PlanetModel *mercury = [[PlanetModel alloc] initWithName: @"Mercury"
													diameter: 4879
												   dayLength:4222.6
										   millionKMsFromSun:57.9];
	PlanetModel *venus = [[PlanetModel alloc] initWithName: @"Venus"
												  diameter: 12104
												 dayLength: 2802
										 millionKMsFromSun: 108.2];
	PlanetModel *earth = [[PlanetModel alloc] initWithName: @"Earth"
												  diameter: 12756
												 dayLength: 24
										 millionKMsFromSun: 149.6];
	PlanetModel *mars = [[PlanetModel alloc] initWithName: @"Mars"
												  diameter: 12756
												 dayLength: 24.7
										millionKMsFromSun: 227.9];
	PlanetModel *jupiter = [[PlanetModel alloc] initWithName: @"Jupiter"
												  diameter: 142984
												 dayLength: 9.9
										   millionKMsFromSun: 778.6];
	PlanetModel *saturn = [[PlanetModel alloc] initWithName: @"Saturn"
												  diameter: 12104
												 dayLength: 2802
										  millionKMsFromSun: 108.2];
	PlanetModel *uranus = [[PlanetModel alloc] initWithName: @"Uranus"
												  diameter: 12104
												 dayLength: 2802
										  millionKMsFromSun: 108.2];
	PlanetModel *neptune = [[PlanetModel alloc] initWithName: @"Neptune"
												  diameter: 12104
												 dayLength: 2802
										   millionKMsFromSun: 108.2];
	PlanetModel *pluto = [[PlanetModel alloc] initWithName: @"Pluto"
												  diameter: 12104
												 dayLength: 2802
										 millionKMsFromSun: 108.2];
	
	return @[mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto];
}

@end
