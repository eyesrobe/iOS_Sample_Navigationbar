//
//  SAMPLEViewController.h
//  SampleNavigationbar
//
//  Created by Sato Toshiyuki on 2013/11/07.
//  Copyright (c) 2013年 Sato Toshiyuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAMPLEViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISegmentedControl* viewBackgroundcolor;
@property (nonatomic, weak) IBOutlet UISegmentedControl* statusbar;
@property (nonatomic, weak) IBOutlet UISegmentedControl* navigationbar;
@property (nonatomic, weak) IBOutlet UISegmentedControl* tintcolor;
@property (nonatomic, weak) IBOutlet UISegmentedControl* barTintcolor;
@property (nonatomic, weak) IBOutlet UISegmentedControl* backgroundcolor;
@property (nonatomic, weak) IBOutlet UISegmentedControl* backgroundimage;

- (IBAction)tapDone:(id)sender;

@end
