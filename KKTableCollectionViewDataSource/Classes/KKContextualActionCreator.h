//
//  KKContextualActionCreator.h
//  KKTableView
//
//  Created by KKWONG on 2020/9/16.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KKContextualActionData.h"
NS_ASSUME_NONNULL_BEGIN

@interface KKContextualActionCreator : NSObject
+ (KKContextualActionCreator *(^)(void))init;
- (KKContextualActionCreator *(^)(UIContextualActionStyle style))actionStyle API_AVAILABLE(ios(11.0));
- (KKContextualActionCreator *(^)(NSString * title))actionTitle;
- (KKContextualActionCreator *(^)(UIColor * bgColor))actionBackgroundColor;
- (KKContextualActionCreator *(^)(UIImage * image))actionImage;
- (KKContextualActionCreator *(^)(ActionCallBack callback))actionCallBack;
@property (nonatomic, strong) KKContextualActionData * contextualActionData;
@end

NS_ASSUME_NONNULL_END
