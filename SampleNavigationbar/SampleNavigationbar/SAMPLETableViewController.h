//
//  SAMPLETableViewController.h
//  SampleNavigationbar
//
//  Created by Sato Toshiyuki on 2013/11/07.
//  Copyright (c) 2013年 Sato Toshiyuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAMPLETableViewController : UITableViewController

@property (assign) BOOL statusBarHidden;
@property (assign) UIStatusBarStyle statusBarStyle;

- (IBAction)tapClose:(id)sender;

@end
