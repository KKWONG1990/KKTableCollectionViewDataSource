//
//  KKContextualActionCreator.m
//  KKTableView
//
//  Created by KKWONG on 2020/9/16.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import "KKContextualActionCreator.h"

@implementation KKContextualActionCreator
+(KKContextualActionCreator * _Nonnull (^)(void))init {
    return ^{
        return [[self alloc] init];
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _contextualActionData = [KKContextualActionData new];
    }
    return self;
}

- (KKContextualActionCreator * _Nonnull (^)(UIContextualActionStyle))actionStyle {
    return ^(UIContextualActionStyle style){
        self.contextualActionData.style = style;
        return self;
    };
}

- (KKContextualActionCreator * _Nonnull (^)(NSString * _Nonnull))actionTitle {
    return ^(NSString * title){
        self.contextualActionData.title = title;
        return self;
    };
}

- (KKContextualActionCreator * _Nonnull (^)(UIColor * _Nonnull))actionBackgroundColor {
    return ^(UIColor * backgroundColor){
        self.contextualActionData.backgroundColor = backgroundColor;
        return self;
    };
}

- (KKContextualActionCreator * _Nonnull (^)(UIImage * _Nonnull))actionImage {
    return ^(UIImage * image){
        self.contextualActionData.image = image;
        return self;
    };
}

- (KKContextualActionCreator * _Nonnull (^)(ActionCallBack _Nonnull))actionCallBack {
    return ^(ActionCallBack callback){
        self.contextualActionData.actionCallBack = callback;
        return self;
    };
}
@end
