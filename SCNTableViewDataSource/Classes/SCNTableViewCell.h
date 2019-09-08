//
//  SCNTableViewCell.h
//  SCNTableViewDataSource
//
//  Created by Stephen Chiang on 2019/9/8.
//

#import <UIKit/UIKit.h>
#import "SCNTableViewItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCNTableViewCell : UITableViewCell

@property (strong, readwrite, nonatomic) SCNTableViewItem *item;

@property (assign, readonly, nonatomic) BOOL loaded;

- (void)cellDidLoad;

- (void)cellWillAppear;

@end

NS_ASSUME_NONNULL_END
