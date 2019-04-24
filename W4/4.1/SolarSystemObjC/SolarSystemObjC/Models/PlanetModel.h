//
//  PlanetModel.h
//  SolarSystemObjC
//
//  Created by Ethan John on 2/11/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlanetModel : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *imageName;
@property (nonatomic, readonly) NSInteger diameter;
@property (nonatomic, readonly) float dayLength;
@property (nonatomic, readonly) float millionKMsFromSun;

- (instancetype)initWithName:(NSString *)name
				   diameter:(NSInteger)diameter
				  dayLength:(float)dayLength
		  millionKMsFromSun:(float)millionKMsFromSun;

@end

NS_ASSUME_NONNULL_END
