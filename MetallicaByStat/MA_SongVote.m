//
//  MA_SongVote.m
//  MetallicaByStat
//
//  Created by Guven Bolukbasi on 2014-07-06.
//  Copyright (c) 2014 GuvenBolukbasi. All rights reserved.
//

#import "MA_SongVote.h"

@implementation MA_SongVote

- (BOOL)isEqual:(id)object {

    if (![object isKindOfClass:[MA_SongVote class]]) {
        return false;
    }
    
    MA_SongVote* otherSong =  (MA_SongVote*) object;
    
    return [otherSong.songName isEqualToString:self.songName];
}

- (NSUInteger)hash {
    return [self.songName hash];
}


@end
