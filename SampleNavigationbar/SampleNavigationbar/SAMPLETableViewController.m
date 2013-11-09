//
//  SAMPLETableViewController.m
//  SampleNavigationbar
//
//  Created by Sato Toshiyuki on 2013/11/07.
//  Copyright (c) 2013年 Sato Toshiyuki. All rights reserved.
//

#import "SAMPLETableViewController.h"

@interface SAMPLETableViewController ()

@end

@implementation SAMPLETableViewController

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Section";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
	cell.textLabel.text = @"ABCDEFGHIJK";
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self tapClose:nil];
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
