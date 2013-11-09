//
//  SAMPLEViewController.m
//  SampleNavigationbar
//
//  Created by Sato Toshiyuki on 2013/11/07.
//  Copyright (c) 2013年 Sato Toshiyuki. All rights reserved.
//

#import "SAMPLEViewController.h"

#import "SAMPLEKakuninViewController.h"
#import "SAMPLETableViewController.h"

@interface SAMPLEViewController ()
@end

@implementation SAMPLEViewController


#pragma mark - ライフサイクル

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	[UINavigationBar appearance].barTintColor = [self colorFromIndex:self.barTintcolor.selectedSegmentIndex];
	[UINavigationBar appearance].tintColor    = [self colorFromIndex:self.tintcolor.selectedSegmentIndex];
	[UINavigationBar appearance].backgroundColor = [self colorFromIndex:self.backgroundcolor.selectedSegmentIndex];
    
	UINavigationController* nav = [segue destinationViewController];
	id vc = nav.topViewController;

    NSString* identifier = [segue identifier];
    UIColor* viewBackgroundColor = [self colorFromIndex:self.viewBackgroundcolor.selectedSegmentIndex];
    if (viewBackgroundColor == nil) {
        viewBackgroundColor = [UIColor whiteColor];
    }
    if ([identifier isEqualToString:@"toKakunin1"]) {
        [(SAMPLEKakuninViewController*)vc view].backgroundColor = viewBackgroundColor;
    } else if ([identifier isEqualToString:@"toKakunin2"]) {
        [(SAMPLETableViewController*)vc tableView].backgroundColor = viewBackgroundColor;
    }
    
    // --------------------------------------------------------------------------------
    // StatusBar
    // --------------------------------------------------------------------------------
	if ([vc respondsToSelector:@selector(setStatusBarHidden:)]) {

		// ステータスバーを消すには複合技が必要
		// 1. [[UIApplication sharedApplication] setStatusBarHidden:self.showStatusbar.on];
		// 2. ステータスバーを消したい各viewControllerで、- (BOOL)prefersStatusBarHidden { return YES; }
        BOOL statusBarHidden = [self statusBarHiddenFromIndex:self.statusbar.selectedSegmentIndex];
		[[UIApplication sharedApplication] setStatusBarHidden:statusBarHidden];
		[vc setStatusBarHidden:statusBarHidden];
        
        // ステータスバーの色を変更するには複合技が必要
        // 1. モーダルビューの遷移先がナビゲーションコントローラの場合に、子ビューコントローラのpreferredStatusBarStyleメソッドが呼ばれない
        //    ので、UINavigationContollerのカテゴリを作成し以下を記述する。
        //    - (UIViewController *)childViewControllerForStatusBarStyle { return self.topViewController; }
        // 2. 子ビューコントローラに以下を記述する。
        //    - (UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }
        if (statusBarHidden == NO) {
            [vc setStatusBarStyle:[self statusBarStyleFromIndex:self.statusbar.selectedSegmentIndex]];
        }
	}

    // --------------------------------------------------------------------------------
    // NavigationBar
    // --------------------------------------------------------------------------------
    BOOL navigationBarHidden = [self navigationBarHiddenFromIndex:self.navigationbar.selectedSegmentIndex];
	[nav setNavigationBarHidden:navigationBarHidden animated:NO];
    
    if (navigationBarHidden == NO) {
        nav.navigationBar.translucent = [self navigationBarTranslucentFromIndex:self.navigationbar.selectedSegmentIndex];
        
        // ステータスバー＋ナビゲーションバーに背景画像
        UIImage* backgroundImage = [self imageFromIndex:self.backgroundimage.selectedSegmentIndex];
        if (backgroundImage) {
            [nav.navigationBar setBackgroundImage:backgroundImage forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
        }
    }
        
    
    
//	nav.navigationBar.tintColor    = [self colorFronIndex:self.tintcolor.selectedSegmentIndex];
//	nav.navigationBar.barTintColor = [self colorFronIndex:self.barTintcolor.selectedSegmentIndex];
}

#pragma mark - ステータスバー

/**
 ステータスバーの表示区分
 */
- (BOOL)statusBarHiddenFromIndex:(NSInteger)index
{
    if (index == 2) {
        return YES;
    }
    
    return NO;
}

/**
 UIStatusBarStyleを取得
 */
- (UIStatusBarStyle)statusBarStyleFromIndex:(NSInteger)index
{
    UIStatusBarStyle statusBar = UIStatusBarStyleDefault;
    if (index == 1) {
        statusBar = UIStatusBarStyleLightContent;
    }

    return statusBar;
}

#pragma mark - ナビゲーションバー

/**
 ナビゲーションバーの表示区分
 */
- (BOOL)navigationBarHiddenFromIndex:(NSInteger)index
{
    if (index == 2) {
        return YES;
    }
    
    return NO;
}

/**
 */
- (BOOL)navigationBarTranslucentFromIndex:(NSInteger)index
{
    BOOL translucent = YES;
    if (index == 1) {
        translucent = NO;
    }
    
    return translucent;
}

#pragma mark - UIColorを取得

/**
 UIColorを取得
 */
- (UIColor *)colorFromIndex:(NSInteger)index
{
	// Defaultの場合はnilを返す
	if (index == 0) {
		return nil;
	}
	
	UIColor* clear  = [UIColor clearColor];
	UIColor* white  = [UIColor whiteColor];
	UIColor* orange = [UIColor redColor];
    UIColor* yellow = [UIColor yellowColor];
    UIColor* blue   = [UIColor blueColor];
	
	NSArray* colorSet = @[clear, white, orange, yellow, blue];
	
	return colorSet[index];
}



#pragma mark - UIImage

/**
 */
- (UIImage *)imageFromIndex:(NSInteger)index
{
    UIImage* image = nil;
    
    switch (index) {
        case 0:
            break;
        case 1:
            image = [UIImage imageNamed:@"bar44px"];
            break;
        case 2:
            image = [UIImage imageNamed:@"bar"];
            break;
        default:
            break;
    }
    
    return image;
}

#pragma mark - アクション

/**
 タップ：確認ボタン
 */
- (IBAction)tapDone:(id)sender
{
	if ([sender tag]==0) {
		[self performSegueWithIdentifier:@"toKakunin1" sender:nil];
	} else {
		[self performSegueWithIdentifier:@"toKakunin2" sender:nil];
	}
}


@end
