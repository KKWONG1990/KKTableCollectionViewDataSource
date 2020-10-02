//
//  KKEmptyEntity.m
//  KKTableView
//
//  Created by KKWONG on 2020/9/15.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import "KKEmptyEntity.h"

@implementation KKEmptyEntity
- (instancetype)init {
    self = [super init];
    if (self) {
        _loadingPosition    = KKEmptyViewLoadingOnCenterPosition;
        _emptyTitle         = @"目前没有数据";
        _emptyTitleColor    = UIColor.darkTextColor;
        _emptyTitleFont     = [UIFont systemFontOfSize:18];
        _emptyDetail        = @"先去看看别的等会再来吧";
        _emptyDetailColor   = UIColor.darkGrayColor;
        _emptyDetailFont    = [UIFont systemFontOfSize:14];
        _emptyLoading       = @"加载中...";
        _emptyLoadingColor  = UIColor.darkTextColor;
        _emptyLoadingFont   = [UIFont systemFontOfSize:16];
        _emptyImageMaxSize  = CGSizeMake(200, 200);
    }
    return self;
}
@end
