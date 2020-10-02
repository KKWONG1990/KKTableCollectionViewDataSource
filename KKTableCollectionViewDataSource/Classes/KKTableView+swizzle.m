//
//  KKTableView+swizzle.m
//  KKTableView
//
//  Created by KKWONG on 2020/9/26.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import "KKTableView+swizzle.h"
#import <objc/runtime.h>
@implementation KKTableView (swizzle)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleFontMethod:@selector(reloadData) exchangeMethod:@selector(kk_reloadData)];
        [self swizzleFontMethod:@selector(insertSections:withRowAnimation:) exchangeMethod:@selector(kk_insertSections:withRowAnimation:)];
        [self swizzleFontMethod:@selector(deleteSections:withRowAnimation:) exchangeMethod:@selector(kk_deleteSections:withRowAnimation:)];
        [self swizzleFontMethod:@selector(reloadSections:withRowAnimation:) exchangeMethod:@selector(kk_reloadSections:withRowAnimation:)];
        [self swizzleFontMethod:@selector(insertRowsAtIndexPaths:withRowAnimation:) exchangeMethod:@selector(kk_insertRowsAtIndexPaths:withRowAnimation:)];
        [self swizzleFontMethod:@selector(deleteRowsAtIndexPaths:withRowAnimation:) exchangeMethod:@selector(kk_deleteRowsAtIndexPaths:withRowAnimation:)];
        [self swizzleFontMethod:@selector(reloadRowsAtIndexPaths:withRowAnimation:) exchangeMethod:@selector(kk_reloadRowsAtIndexPaths:withRowAnimation:)];
    });
}

+ (void)swizzleFontMethod:(SEL)originSel exchangeMethod:(SEL)exchangeSel {
    Method originMethod     = class_getInstanceMethod(self, originSel);
    Method exchangeMethod   = class_getInstanceMethod(self, exchangeSel);
    method_exchangeImplementations(originMethod, exchangeMethod);
}

- (void)kk_reloadData {
    [self kk_reloadData];
    [self kk_checkDatasourceCount];
}

- (void)kk_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    [self kk_insertSections:sections withRowAnimation:animation];
    [self kk_checkDatasourceCount];
}

- (void)kk_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    [self kk_deleteSections:sections withRowAnimation:animation];
    [self kk_checkDatasourceCount];
}

- (void)kk_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    [self kk_reloadSections:sections withRowAnimation:animation];
    [self kk_checkDatasourceCount];
}

- (void)kk_insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    [self kk_insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self kk_checkDatasourceCount];
}

- (void)kk_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    [self kk_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self kk_checkDatasourceCount];
}

- (void)kk_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    [self kk_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self kk_checkDatasourceCount];
}

- (void)kk_checkDatasourceCount {
    NSUInteger count = [self kk_itemsCount];
    if (self.kCustomEmptyView) {
        self.kCustomEmptyView.hidden = count;
    } else {
        self.kEmptyView.hidden = count;
    }
    if (self.mj_footer) {
        self.mj_footer.hidden = !count;
    }
}

- (NSInteger)kk_itemsCount {
    NSUInteger count = 0;
    for (KKSectionCreator * creator in self.kDatasource.sectionCreators) {
        count = count + creator.section.datasource.count;
    }
    return count;
}
@end
