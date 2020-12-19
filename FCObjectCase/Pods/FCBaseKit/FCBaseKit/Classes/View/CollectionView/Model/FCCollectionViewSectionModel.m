//
//  FCCollectionViewSectionModel.m
//  FCBaseKit
//
//  Created by 石富才 on 2020/12/16.
//

#import "FCCollectionViewSectionModel.h"

@interface FCCollectionViewSectionModel ()

/** <#aaa#>  */
@property(nonatomic, strong)NSMutableArray<FCCollectionViewItemModel *> *items;

@end

@implementation FCCollectionViewSectionModel

- (NSMutableDictionary *)blockActions{
    if (!_blockActions) {
        _blockActions = NSMutableDictionary.dictionary;
    }
    return _blockActions;
}
- (NSMutableArray<FCCollectionViewItemModel *> *)items{
    if (!_items) {
        _items = NSMutableArray.array;
    }
    return _items;
}

@end

@implementation FCCollectionViewItemModel

- (NSMutableDictionary *)blockActions{
    if (!_blockActions) {
        _blockActions = NSMutableDictionary.dictionary;
    }
    return _blockActions;
}

@end
