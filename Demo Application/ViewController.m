//
//  ViewController.m
//  Demo Application
//
//  Created by Akshat Singhal on 29/03/15.
//  Copyright (c) 2015 New ventures. All rights reserved.
//

#import "ViewController.h"

#define UILABEL_COUNT 5

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float verticalGap = self.view.frame.size.height / (UILABEL_COUNT + 1);
    float xPos = self.view.frame.size.width/2;
    for (int i = 1; i <= UILABEL_COUNT; i++) {
        UILabel *textLabel = [self textLabelWithText:[NSString stringWithFormat:@"LABEL NO %d", i]];
        textLabel.center = CGPointMake(xPos, verticalGap * i);
        [self.view addSubview:textLabel];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (UILabel *)textLabelWithText:(NSString *)text {
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 40)];
    textLabel.text = text;
    textLabel.textAlignment = NSTextAlignmentCenter;
    return textLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
