//
//  ViewController.m
//  FizzBuzzObjC
//
//  Created by Ethan John on 2/14/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
//	NSInteger input = 100;
//
//	for (NSInteger i = 0; i <= input; i++) {
//		if (i % 3 == 0 && i % 5 == 0) {
//			NSLog(@"DevMtn");
//		} else if (i % 3 == 0) {
//			NSLog(@"Dev");
//		} else if (i % 5 == 0) {
//			NSLog(@"Mtn");
//		} else {
//			NSLog(@"%ld", (long)i);
//		}
//	}
	
	[self closestFibWith:1000];
	
	
}

- (void)closestFibWith:(NSInteger)input
{
	NSInteger A = 0;
	NSInteger B = 1;
	while (B < input) {
		NSInteger C = A + B;
		A = B;
		B = C;
	}
	NSLog(@"%ld", (long)A);
	NSLog(@"%ld", (long)B);
}


@end
