//
//  MA_SecondViewController.m
//  MetallicaByStat
//
//  Created by Guven Bolukbasi on 2014-07-05.
//  Copyright (c) 2014 GuvenBolukbasi. All rights reserved.
//

#import "MA_SecondViewController.h"

@interface MA_SecondViewController ()

@end

@implementation MA_SecondViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return 4; }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = nil;
    
    switch (indexPath.row) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"VoteCell"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"AllCell"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"RareCell"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"FavCell"];
            break;
        default:
            cell = nil;
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
