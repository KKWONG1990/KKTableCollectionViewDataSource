//
//  KKContextualActionData.h
//  KKTableView
//
//  Created by KKWONG on 2020/9/16.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^ActionCallBack)(NSIndexPath * indexPath);
@interface KKContextualActionData : NSObject
@property (nonatomic, assign) UIContextualActionStyle style API_AVAILABLE(ios(11.0));
@property (nonatomic, copy) NSString * title;
@property (nonatomic, strong) UIColor * backgroundColor;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, copy) ActionCallBack actionCallBack;
@end

NS_ASSUME_NONNULL_END
