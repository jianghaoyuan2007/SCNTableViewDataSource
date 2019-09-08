//
//  SCNTableViewItem.h
//  SCNTableViewDataSource
//
//  Created by Stephen Chiang on 2019/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCNTableViewItem : NSObject

@property (nonatomic, copy) NSString *title;

@property (copy, readwrite, nonatomic) void (^selectionHandler)(id item);

+ (instancetype)itemWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
