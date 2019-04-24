//
//  Planet.m
//  SolarSystem
//
//  Created by Ethan John on 2/10/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import "Planet.h"

@implementation Planet

- (instancetype)initWithName:(NSString *)name diameter:(NSInteger)diameter dayLength:(NSInteger)dayLength millionKMsFromSun:(float)millionKMsFromSun
{
	self = [super init];
	if (self) {
		_name = [name copy];
		_imageName = [name copy];
		_diameter = diameter;
		_millionKMsFromSun = millionKMsFromSun;
	}
	return self;
}

@end
