//
//  SAMPLEKakuninViewController.m
//  SampleNavigationbar
//
//  Created by Sato Toshiyuki on 2013/11/07.
//  Copyright (c) 2013年 Sato Toshiyuki. All rights reserved.
//

#import "SAMPLEKakuninViewController.h"

@interface SAMPLEKakuninViewController ()

@end

@implementation SAMPLEKakuninViewController

#pragma mark - ライフサイクル

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - ステータスバー

/**
 */
- (BOOL)prefersStatusBarHidden
{
	return self.statusBarHidden;
}

/**
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
	return self.statusBarStyle;
}

#pragma mark - アクション

/**
 閉じる
 */
- (IBAction)tapClose:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
}


@end
