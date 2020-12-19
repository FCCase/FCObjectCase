//
//  FCObjectCaseTableViewPresenter.m
//  FCObjectCase
//
//  Created by 石富才 on 2020/12/17.
//

#import "FCObjectCaseTableViewPresenter.h"

@interface FCObjectCaseTableViewPresenter ()

@end

@implementation FCObjectCaseTableViewPresenter

//MARK: UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datas.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas[section].cells.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FCTableViewCellModel *cellM = self.datas[indexPath.section].cells[indexPath.row];
    cellM.indexPath = indexPath;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellM.cellClass) forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(setCellM:)]) {
        [cell performSelector:@selector(setCellM:) withObject:cellM];
    }
    return cell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.datas[section].titleAttri.string;
}
//MARK: UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FCTableViewCellModel *cellM = self.datas[indexPath.section].cells[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:cellM.deselectRowAnimated];
    if (self.didSelectRowAtIndexPath) {
        self.didSelectRowAtIndexPath(indexPath);
    }
}

@end
