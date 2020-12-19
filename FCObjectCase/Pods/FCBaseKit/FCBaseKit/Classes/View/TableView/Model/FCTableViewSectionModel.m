//
//  FCTableViewSectionModel.m
//  FCBaseKit
//
//  Created by 石富才 on 2020/12/16.
//

#import "FCTableViewSectionModel.h"

@interface FCTableViewSectionModel ()

/** <#aaa#>  */
@property(nonatomic, strong)NSMutableArray<FCTableViewCellModel *> *cells;

@end

@implementation FCTableViewSectionModel

- (NSMutableDictionary *)blockActions{
    if (!_blockActions) {
        _blockActions = NSMutableDictionary.dictionary;
    }
    return _blockActions;
}

- (NSMutableArray<FCTableViewCellModel *> *)cells{
    if (!_cells) {
        _cells = NSMutableArray.array;
    }
    return _cells;
}

@end

@implementation FCTableViewCellModel

- (NSMutableDictionary *)blockActions{
    if (!_blockActions) {
        _blockActions = NSMutableDictionary.dictionary;
    }
    return _blockActions;
}

@end
