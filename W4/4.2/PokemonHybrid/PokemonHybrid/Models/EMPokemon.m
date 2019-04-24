//
//  EMPokemon.m
//  PokemonHybrid
//
//  Created by Ethan John on 2/12/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import "EMPokemon.h"

@implementation EMPokemon

-(instancetype) initWithName:(NSString *)name
				  identifier:(NSInteger)identifier
				   abilities:(NSArray<NSString *> *)abilities
			  imageUrlString:(NSString *)imageUrl
{
	self = [super init];
	if (self) {
		_name = name;
		_identifier = identifier;
		_abilities = abilities;
		_imageUrlString = imageUrl;
	}
	return self;
}

@end

@implementation EMPokemon (JSONConvertible)

-(instancetype) initWithDictionary:(NSDictionary<NSString *,id> *)dict
{
	// guard let name = dictionary["name"] as? String else { return }
	NSString * name = dict[@"name"];
	NSInteger identifier = [dict[@"id"] integerValue];
	NSArray * abilitiesArray = dict[@"abilities"];
	NSString * imageUrl = dict[@"sprites"][@"front_shiny"];
	
	// If either of these values are not the correct type we will fail this initializer
	if (![name isKindOfClass:[NSString class]] || ![abilitiesArray isKindOfClass:[NSArray class]] || ![imageUrl isKindOfClass:[NSString class]])
	{
		return nil;
	}
	
	NSMutableArray<NSString *> * abilities = [NSMutableArray new];
	
	for (NSDictionary *dictionary in abilitiesArray) {
		NSString *ability = dictionary[@"ability"][@"name"];
		if (ability) {
			[abilities addObject:ability];
		}
	}
	
	return [self initWithName:name identifier:identifier abilities:abilities imageUrlString:imageUrl];
}

@end
