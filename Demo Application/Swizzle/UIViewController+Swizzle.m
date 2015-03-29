//
//  UIViewController+Logging.m
//  Demo Application
//
//  Created by Akshat Singhal on 29/03/15.
//  Copyright (c) 2015 New ventures. All rights reserved.
//

#import "UIViewController+Swizzle.h"


@implementation UIViewController(Swizzle)

+ (void)load {
    [Swizzle exchangeImplementation:@"viewDidAppear:" InClass:[self class]];
}
- (void) swizzled_viewDidAppear:(BOOL)animated {
    
    [self.view addGestureRecognizer:[self tapGesture]];
    [self.view setUserInteractionEnabled:YES];
    NSLog(@"logged view did appear for %@", [self class]);
    [self swizzled_viewDidAppear:animated];
}


- (UITapGestureRecognizer *)tapGesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    return tapGesture;
}


- (void)viewTapped:(UITapGestureRecognizer *)gestureRecogniser {
    CGPoint location = [gestureRecogniser locationInView:gestureRecogniser.view];
    NSLog(@"%@", NSStringFromCGPoint(location));
    [[[UIAlertView alloc] initWithTitle:@"TOUCH EVENT" message:[Swizzle viewTappedInsideView:self.view AtPoint:location] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
//    NSLog(@"%@", [Swizzle viewTappedInsideView:self.view AtPoint:location]);
}




@end
