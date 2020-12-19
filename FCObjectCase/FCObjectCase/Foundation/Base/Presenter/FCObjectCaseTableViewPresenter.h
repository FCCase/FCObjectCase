//
//  FCObjectCaseTableViewPresenter.h
//  FCObjectCase
//
//  Created by 石富才 on 2020/12/17.
//

#import <Foundation/Foundation.h>
#import <FCBaseKit/FCBaseKit.h>

@interface FCObjectCaseTableViewPresenter : NSObject<UITableViewDelegate,UITableViewDataSource>

/** <#aaa#>  */
@property(nonatomic, strong)NSMutableArray<FCTableViewSectionModel *> *datas;

/** <#aaa#>  */
@property(nonatomic, copy)void(^didSelectRowAtIndexPath)(NSIndexPath *indexPath);

@end
