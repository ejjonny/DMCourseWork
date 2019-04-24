//
//  EMPokemonController.h
//  PokemonHybrid
//
//  Created by Ethan John on 2/12/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EMPokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface EMPokemonController : NSObject

+(void)fetchPokemonForSearchTerm: (NSString *)searchTerm
					  completion: (void (^_Nullable) (EMPokemon *_Nullable))completion;
+(void)fetchImageForPokemon: (EMPokemon *)pokemon
				 completion: (void (^_Nullable) (UIImage *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
