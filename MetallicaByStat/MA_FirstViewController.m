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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MA_CityParser* parser = [[MA_CityParser alloc] init];
    self.orderedVotes = [parser parse];
    NSNumber* numb = [self.orderedVotes valueForKeyPath:@"@sum.voteCount"];
    self.totalCount = numb.intValue;
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {return self.orderedVotes.count; }

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell"];
    
    UILabel* song = (UILabel*) [cell.contentView viewWithTag:1];
    UILabel* vote = (UILabel*) [cell.contentView viewWithTag:2];
    UILabel* percent = (UILabel*) [cell.contentView viewWithTag:4];
    
    MA_SongVote* songVote = self.orderedVotes[indexPath.row];
    song.text = songVote.songName;
    vote.text = [NSString stringWithFormat:@"%d", songVote.voteCount];
    int percentage = (int) ((songVote.voteCount / self.totalCount) * 100);
    percent.text = [NSString stringWithFormat:@"%d%%", percentage];
    
    return cell;
}

@end
