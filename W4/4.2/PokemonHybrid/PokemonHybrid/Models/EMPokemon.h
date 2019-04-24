//
//  EMPokemon.h
//  PokemonHybrid
//
//  Created by Ethan John on 2/12/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EMPokemon : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, readonly, copy) NSArray<NSString *> *abilities;
@property (nonatomic, readonly, copy) NSString *imageUrlString;

-(instancetype) initWithName:(NSString *)name
				  identifier:(NSInteger)identifier
				   abilities:(NSArray<NSString *> *)abilities
			  imageUrlString:(NSString *)imageUrl;

@end

@interface EMPokemon (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END
