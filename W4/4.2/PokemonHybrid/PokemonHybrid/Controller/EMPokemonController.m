//
//  EMPokemonController.m
//  PokemonHybrid
//
//  Created by Ethan John on 2/12/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import "EMPokemonController.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon/";

@implementation EMPokemonController

+(void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(EMPokemon * _Nullable))completion
{
	NSURL *baseURL = [NSURL URLWithString:baseURLString];
	NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
	NSLog(@"%@", [searchURL absoluteString]);
	NSLog(@"%@", searchURL);

	[[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
			completion(nil);
			return;
		}
		if (response) {
			NSLog(@"%@", response);
		}
		if (data) {
			NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
			if (!topLevelDictionary) {
				NSLog(@"Error parsing json. In %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
				completion(nil);
				return;
			}
			EMPokemon * pokemon = [[EMPokemon new] initWithDictionary:topLevelDictionary];
			completion(pokemon);
		}
	}] resume];
}

+(void)fetchImageForPokemon:(EMPokemon *)pokemon completion:(void (^)(UIImage * _Nullable))completion
{
	NSURL *baseURL = [NSURL URLWithString:pokemon.imageUrlString];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL];
	[request setHTTPMethod:@"GET"];
	
	[[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
			completion(nil);
			return;
		}
		if (response) {
			NSLog(@"%@", response);
		}
		if (data) {
			UIImage *image = [UIImage imageWithData:data];
			completion(image);
		}
	}] resume];
}

@end
