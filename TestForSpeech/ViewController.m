//
//  ViewController.m
//  TestForSpeech
//
//  Created by Shane on 2019/7/3.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "ViewController.h"
#import "SpeechViewController.h"
#import "Speech/DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)clickAction:(UIButton *)sender {
    SpeechViewController *speechController = [[SpeechViewController alloc] init];
    [self.navigationController pushViewController:speechController animated:YES];
}

@end
