//
//  ViewController.m
//  TuesdayStretch
//
//  Created by Ethan John on 2/12/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSMutableArray * array = [NSMutableArray new];
	[array addObjectsFromArray: @[@1, @3, @4, @5, @6]];
	
	NSLog(@"%@", [self reverseArray:array]);
	
}

- (NSArray *)reverseArray:(NSMutableArray *)array
{
	NSLog(@"%@", [[array reverseObjectEnumerator] allObjects]);
	return [[array reverseObjectEnumerator] allObjects];
}


@end
