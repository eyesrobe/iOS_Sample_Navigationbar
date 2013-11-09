//
//  UINavigationController+StatusBarStyle.m
//  SampleNavigationbar
//
//  Created by Toshi on 2013/11/07.
//  Copyright (c) 2013年 Sato Toshiyuki. All rights reserved.
//

#import "UINavigationController+StatusBarStyle.h"

@implementation UINavigationController (StatusBarStyle)

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

@end
