//
//  Planet.h
//  SolarSystem
//
//  Created by Ethan John on 2/10/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Planet : NSObject

- (instancetype)initWithName:(NSString *)name
					diameter:(NSInteger)diameter
				   dayLength:(NSInteger)dayLength
		   millionKMsFromSun:(float)millionKMsFromSun;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *imageName;
@property (nonatomic, readonly) NSInteger diameter;
@property (nonatomic, readonly) float dayLength;
@property (nonatomic, readonly) float millionKMsFromSun;


@end

NS_ASSUME_NONNULL_END
