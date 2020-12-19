//
//  ViewController.m
//  FCObjectCase
//
//  Created by 石富才 on 2020/12/15.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <CTMediator/CTMediator.h>

#import <FCCategoryOCKit/FCCategoryOCKit.h>
#import <FCBaseKit/FCBaseKit.h>
#import "FCObjectCaseTableViewPresenter.h"

//View
#import "FCObjectCaseTableViewCell.h"

@interface ViewController ()

/** <#aaa#>  */
@property(nonatomic, strong)NSMutableArray<FCTableViewSectionModel *> *datas;

/** <#aaa#>  */
@property(nonatomic, strong)UITableView *tableView;
/** <#aaa#>  */
@property(nonatomic, strong)FCObjectCaseTableViewPresenter *presenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"架包";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)vcTransform:(UIViewController *)vc cellModel:(FCTableViewCellModel *)cellM{
    switch (cellM.vcAnimationType) {
        case FCBaseKitVCAnimationTypePush:{
            [self.navigationController pushViewController:vc animated:cellM.vcAnimation];
        }break;
        case FCBaseKitVCAnimationTypePop:{
            [self.navigationController popToViewController:self animated:cellM.vcAnimation];
        }break;
        case FCBaseKitVCAnimationTypePresent:{
            [self presentViewController:vc animated:cellM.vcAnimation completion:nil];
        }break;
        case FCBaseKitVCAnimationTypeDismiss:{
            [vc dismissViewControllerAnimated:cellM.vcAnimation completion:nil];
        }break;
            
        default:
            break;
    }
}


//MARK: getter 方法
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
        _tableView.delegate = self.presenter;
        _tableView.dataSource = self.presenter;
        _tableView.estimatedRowHeight = 50;
        //
        [_tableView registerClass:FCObjectCaseTableViewCell.class forCellReuseIdentifier:NSStringFromClass(FCObjectCaseTableViewCell.class)];
    }
    return _tableView;
}
- (FCObjectCaseTableViewPresenter *)presenter{
    if (!_presenter) {
        _presenter = FCObjectCaseTableViewPresenter.new;
        _presenter.datas = self.datas;
        FCWeakSelf(self);
        [_presenter setDidSelectRowAtIndexPath:^(NSIndexPath *indexPath) {
            FCTableViewCellModel *cellM = weakself.datas[indexPath.section].cells[indexPath.row];
            if ([weakself respondsToSelector:cellM.selector]) {
                [weakself performSelector:cellM.selector withObject:cellM];
            }else if (!FCIsEmpty(cellM.router)){
                UIViewController *vc = [CTMediator.sharedInstance performActionWithUrl:[NSURL URLWithString:cellM.router] completion:nil];
                if (vc) {
                    [weakself vcTransform:vc cellModel:cellM];
                }
            }else if (!FCIsEmpty(cellM.target) && !FCIsEmpty(cellM.action)){
                UIViewController *vc = [CTMediator.sharedInstance performTarget:cellM.target action:cellM.action params:cellM.routerParams shouldCacheTarget:NO];
                if (vc) {
                    [weakself vcTransform:vc cellModel:cellM];
                }
            }
        }];
    }
    return _presenter;
}
- (NSMutableArray<FCTableViewSectionModel *> *)datas{
    if (!_datas) {
        _datas = NSMutableArray.array;
        
        FCTableViewSectionModel *objectSectionM = [[FCTableViewSectionModel alloc]init:^(FCTableViewSectionModel *sm) {
            sm.titleAttri = fc_attriBold(@"NSObject", UIColor.blueColor, 18);
            //数字格式化
            FCTableViewCellModel *numberFormatterCellM = [[FCTableViewCellModel alloc]init:^(FCTableViewCellModel *cm) {
                cm.cellClass = FCObjectCaseTableViewCell.class;
                cm.titleAttri = fc_attri(@"数字格式化：NSObject-NSFormatter-NSNumberFormatter", UIColor.lightGrayColor, 15);
                /**
                 数字格式化 "Object/NumberFormatterVC"
                 */
                cm.router = @"FC://Object/NumberFormatterVC";
                cm.vcAnimationType = FCBaseKitVCAnimationTypePush;
                cm.vcAnimation = YES;
            }];
            [sm.cells addObject:numberFormatterCellM];
            //重量格式化
            FCTableViewCellModel *massFormatterCellM = [[FCTableViewCellModel alloc]init:^(FCTableViewCellModel *cm) {
                cm.cellClass = FCObjectCaseTableViewCell.class;
                cm.titleAttri = fc_attri(@"重量格式化：NSObject-NSFormatter-NSMassFormatter", UIColor.lightGrayColor, 15);
            }];
            [sm.cells addObject:massFormatterCellM];
            //NSLengthFormatter
            FCTableViewCellModel *lengthFormatterCellM = [[FCTableViewCellModel alloc]init:^(FCTableViewCellModel *cm) {
                cm.cellClass = FCObjectCaseTableViewCell.class;
                cm.titleAttri = fc_attri(@"NSObject-NSFormatter-NSLengthFormatter", UIColor.lightGrayColor, 15);
            }];
            [sm.cells addObject:lengthFormatterCellM];
            //NSEnergyFormatter
            FCTableViewCellModel *energyFormatterCellM = [[FCTableViewCellModel alloc]init:^(FCTableViewCellModel *cm) {
                cm.cellClass = FCObjectCaseTableViewCell.class;
                cm.titleAttri = fc_attri(@"NSObject-NSFormatter-NSEnergyFormatter", UIColor.lightGrayColor, 15);
            }];
            [sm.cells addObject:energyFormatterCellM];
        }];
        [_datas addObject:objectSectionM];
    }
    return _datas;
}

@end
