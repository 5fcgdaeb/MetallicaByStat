//
//  MA_FirstViewController.m
//  MetallicaByStat
//
//  Created by Guven Bolukbasi on 2014-07-05.
//  Copyright (c) 2014 GuvenBolukbasi. All rights reserved.
//

#import "MA_FirstViewController.h"

@interface MA_FirstViewController ()
@property (nonatomic, strong) NSMutableArray* orderedVotes;
@property (nonatomic, assign) int totalCount;
@end

@implementation MA_FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
    MA_CityParser* parser = [[MA_CityParser alloc] init];
    self.orderedVotes = [parser parse];
    NSNumber* numb = [self.orderedVotes valueForKeyPath:@"@sum.voteCount"];
    //self.totalCount = 11762;
    self.totalCount = numb.intValue / 17;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath { return  66.0; }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {return self.orderedVotes.count; }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell"];
    
    UILabel* song = (UILabel*) [cell.contentView viewWithTag:1];
    UILabel* vote = (UILabel*) [cell.contentView viewWithTag:2];
    UIView* foreGround = (UIView*) [cell.contentView viewWithTag:3];
    UILabel* percent = (UILabel*) [cell.contentView viewWithTag:4];
    
    MA_SongVote* songVote = self.orderedVotes[indexPath.row];
    song.text = songVote.songName;
    NSNumberFormatter *numberFormat = [[NSNumberFormatter alloc] init];
    numberFormat.usesGroupingSeparator = YES;
    numberFormat.groupingSeparator = @",";
    numberFormat.groupingSize = 3;
    vote.text = [numberFormat stringFromNumber:[NSNumber numberWithInt:songVote.voteCount]];
    int percentage = (int) ((songVote.voteCount * 100.0f) / self.totalCount);
    percent.text = [NSString stringWithFormat:@"%d%%", percentage];
    
    for (NSLayoutConstraint* constraint in foreGround.constraints) {
        constraint.constant = (280 * percentage) / 100;
    }
    
    [cell needsUpdateConstraints];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
