//
//  FCTableViewSectionModel.h
//  FCBaseKit
//
//  Created by 石富才 on 2020/12/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FCBaseKitHeader.h"

@class FCTableViewCellModel;
@interface FCTableViewSectionModel : NSObject

/** 事件集合  */
@property(nonatomic, strong)NSMutableDictionary *blockActions;

/** 组头 supplementView 的 Class  */
@property(nonatomic)Class headerClass;
/** 组头 supplementView 的 size   */
@property(nonatomic)CGSize headerSize;
/** 组头 supplementView 的大小决方式  */
@property(nonatomic, assign)FCBaseKitSizeType headerSizeType;
/** 组头 supplementView 的边距  */
@property(nonatomic)UIEdgeInsets headerEdgeInsets;
/** 组头 supplementView 的背景颜色  */
@property(nonatomic, strong)UIColor *headerBackgroundColor;

/** 组尾  supplementView 的 Class  */
@property(nonatomic)Class footerClass;
/** 组尾  supplementView 的 size   */
@property(nonatomic)CGSize footerSize;
/** 组尾  supplementView 的大小决方式  */
@property(nonatomic, assign)FCBaseKitSizeType footerSizeType;
/** 组尾  supplementView 的边距  */
@property(nonatomic)UIEdgeInsets footerEdgeInsets;
/** 组尾 supplementView 的背景颜色  */
@property(nonatomic, strong)UIColor *footerBackgroundColor;

/** 索引  */
@property(nonatomic, strong)NSIndexPath *indexPath;

/** 标题  */
@property(nonatomic, strong)NSAttributedString *titleAttri;
/** 子标题  */
@property(nonatomic, strong)NSAttributedString *subTitleAttri;

/** <#aaa#>  */
@property(nonatomic, strong, readonly)NSMutableArray<FCTableViewCellModel *> *cells;

@end


@interface FCTableViewCellModel : NSObject

/** 事件集合  */
@property(nonatomic, strong)NSMutableDictionary *blockActions;
/** 大小决方式  */
@property(nonatomic, assign)FCBaseKitSizeType sizeType;
/** UITableViewCell 的 class  */
@property(nonatomic)Class cellClass;
/** UITableViewCell 的size  */
@property(nonatomic)CGSize cellSize;
/** UITableViewCell 的背景颜色  */
@property(nonatomic, strong)UIColor *backgroundColor;
/** UITableViewCell 的索引  */
@property(nonatomic, strong)NSIndexPath *indexPath;
/** UITableViewCell 的内容边距  */
@property(nonatomic)UIEdgeInsets contentEdgeInsets;
/** 标题  */
@property(nonatomic, strong)NSAttributedString *titleAttri;
/** 子标题  */
@property(nonatomic, strong)NSAttributedString *subTitleAttri;


/** cell 选中时是否有动画  */
@property(nonatomic, assign)BOOL deselectRowAnimated;

//--------------》分割线
/** UICollectionViewCell 为分割线时，分割线颜色  */
@property(nonatomic, strong)UIColor *lineColor;
//-------------《

//--------------》路由
/** 类  */
@property(nonatomic, copy)NSString *target;
/** 方法  */
@property(nonatomic, copy)NSString *action;
/** 路由参数  */
@property(nonatomic, strong)NSDictionary *routerParams;

//** 路由地址： **://Target_**/Action_**?a=1&b=2 */
@property(nonatomic, copy)NSString *router;
//---------------《

//--------------- 》
/** <#aaa#>  */
@property(nonatomic)SEL selector;
//---------------《
/** 控制器专场动画  */
@property(nonatomic, assign)FCBaseKitVCAnimationType vcAnimationType;
/** 控制器专场时是否加动画  */
@property(nonatomic, assign)BOOL vcAnimation;

@end
