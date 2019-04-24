//
//  PlanetModel.m
//  SolarSystemObjC
//
//  Created by Ethan John on 2/11/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import "PlanetModel.h"

@implementation PlanetModel

-(instancetype)initWithName:(NSString *)name
				   diameter:(NSInteger)diameter
				  dayLength:(float)dayLength
		  millionKMsFromSun:(float)millionKMsFromSun;
{
	self = [super init];
	if (self) {
		_name = name;
		_imageName = [name lowercaseString];
		_diameter = diameter;
		_dayLength = dayLength;
		_millionKMsFromSun = millionKMsFromSun;
	}
	return self;
}

@end
