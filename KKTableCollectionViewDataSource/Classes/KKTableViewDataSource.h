//
//  KKTableViewDataSource.h
//  KKTableView
//
//  Created by KKWONG on 2020/9/8.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KKSectionCreator.h"
#import "KKContextualActionCreator.h"
NS_ASSUME_NONNULL_BEGIN

@interface KKTableViewDataSource : NSObject<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray<KKSectionCreator *> * sectionCreators;
@property (nonatomic, strong) NSArray<NSString *> * sectionIndexTitles;
@end

NS_ASSUME_NONNULL_END
