//
//  SCNTableViewCell.m
//  SCNTableViewDataSource
//
//  Created by Stephen Chiang on 2019/9/8.
//

#import "SCNTableViewCell.h"

@interface SCNTableViewCell ()

@property (assign, readwrite, nonatomic) BOOL loaded;

@end

@implementation SCNTableViewCell

- (void)cellDidLoad {
    self.loaded = YES;
}

- (void)cellWillAppear {
    SCNTableViewItem __unused *item = (SCNTableViewItem *)self.item;
    self.textLabel.text = item.title;
}

@end
