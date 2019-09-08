//
//  SCNTableViewDataSource.m
//  SCNTableViewDataSource
//
//  Created by Stephen Chiang on 2019/9/8.
//

#import "SCNTableViewDataSource.h"
#import "SCNTableViewCell.h"

@interface SCNTableViewDataSource ()

///-----------------------------
/// @name Managing Custom Cells
///-----------------------------

/**
 The array of pairs of items / cell classes.
 */
@property (strong, readwrite, nonatomic) NSMutableDictionary *registeredClasses;

/**
 For each custom item class that the manager will use, register a cell class.
 
 @param objectClass The object class to be associated with a cell class.
 @param identifier The cell class identifier.
 */
- (void)registerClass:(NSString *)objectClass forCellWithReuseIdentifier:(NSString *)identifier;

@end

@implementation SCNTableViewDataSource

#pragma mark - Setter

- (void)setItems:(NSArray<SCNTableViewItem *> *)items {
    if (_items != items) {
        _items = [items copy];
        [self.tableView reloadData];
    }
}

- (NSMutableDictionary *)registeredClasses {
    if (!_registeredClasses) {
        _registeredClasses = NSMutableDictionary.new;
    }
    return _registeredClasses;
}

#pragma mark -

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInvalidArgumentException
                                   reason:@"Use +dataSourceWithTableView:"
                                 userInfo:nil];
}

- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self = [super init]) {
        self.tableView = tableView;
        self.tableView.dataSource = self;
        [self registerNibs];
        [self registerClasses];
    }
    return self;
}

+ (instancetype)dataSourceWithTableView:(UITableView *)tableView {
    return [[SCNTableViewDataSource alloc] initWithTableView:tableView];
}

#pragma mark - Registering

- (void)registerNibs {
    
}

- (void)registerClasses {
    self[NSStringFromClass(SCNTableViewItem.class)] = NSStringFromClass(SCNTableViewCell.class);
}

- (void)registerClass:(NSString *)objectClass forCellWithReuseIdentifier:(NSString *)identifier {
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(identifier)];
    if ([bundle pathForResource:identifier ofType:@"nib"]) {
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:bundle]
             forCellReuseIdentifier:objectClass];

    } else {
        [self.tableView registerClass:NSClassFromString(identifier)
               forCellReuseIdentifier:objectClass];
    }
    self.registeredClasses[(id <NSCopying>)NSClassFromString(objectClass)] = NSClassFromString(identifier);
}

- (id)objectAtKeyedSubscript:(id <NSCopying>)key {
    return self.registeredClasses[key];
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key {
    [self registerClass:(NSString *)key forCellWithReuseIdentifier:obj];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SCNTableViewItem *item = self.items[indexPath.row];
    SCNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(item.class)
                                                             forIndexPath:indexPath];
    void (^loadCell)(SCNTableViewCell *cell) = ^(SCNTableViewCell *cell) {
        [cell cellDidLoad];
    };
    if ([cell isKindOfClass:[SCNTableViewCell class]] && [cell respondsToSelector:@selector(loaded)] && !cell.loaded) {
        loadCell(cell);
    }
    cell.item = item;
    [cell cellWillAppear];
    return cell;
}

@end
