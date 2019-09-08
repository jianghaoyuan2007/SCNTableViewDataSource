//
//  SCNTableViewDataSource.h
//  SCNTableViewDataSource
//
//  Created by Stephen Chiang on 2019/9/8.
//

#import <UIKit/UIKit.h>
#import <SCNTableViewDataSource/SCNTableViewItem.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCNTableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, copy) NSArray<SCNTableViewItem *> *items;

/**
 Returns cell class at the keyed subscript.
 
 @param key The keyed subscript.
 @return The cell class the keyed subscript.
 */
- (id)objectAtKeyedSubscript:(id <NSCopying>)key;

/**
 Sets a cell class for the keyed subscript.
 
 @param obj The cell class to set for the keyed subscript.
 @param key The keyed subscript.
 */
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

+ (instancetype)dataSourceWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
