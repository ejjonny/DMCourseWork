//
//  ViewController.m
//  WednesdayStretch
//
//  Created by Ethan John on 2/13/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSArray * exampleArray = [[NSArray alloc] init];
	exampleArray = @[@1, @22, @3, @10, @1, @9, @3, @3];
	NSMutableArray * newArray = [[NSMutableArray alloc] init];
	
	[newArray insertObject:[exampleArray firstObject] atIndex:0];
	
	for (NSObject * object in exampleArray) {
		
		if (object > [newArray firstObject]) {
			NSLog(@"Greater than");
			[newArray insertObject:object atIndex: 0];
		} else if (object <= [newArray firstObject]){
			NSLog(@"Less than / equal to");
			[newArray insertObject:object atIndex:[newArray count]];
		}
		
		NSLog(@"%@", newArray);
	}
	
	NSLog(@"%@", [newArray firstObject]);
	
	
	
	
	
}


@end
