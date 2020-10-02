//
//  KKEmptyEntityCreator.m
//  KKTableView
//
//  Created by KKWONG on 2020/9/15.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import "KKEmptyEntityCreator.h"

@implementation KKEmptyEntityCreator
+ (KKEmptyEntityCreator * _Nonnull (^)(void))init {
    return ^{
        return [[self alloc] init];
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _emptyEntity = [KKEmptyEntity new];
    }
    return self;
}

- (KKEmptyEntityCreator * _Nonnull (^)(NSString * _Nullable))emptyImageName {
    return ^(NSString * name){
        self.emptyEntity.emptyImageName = name;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(NSString * _Nullable))emptyTitle {
    return ^(NSString * title){
        self.emptyEntity.emptyTitle = title;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(UIColor * _Nullable))emptyTitleColor {
    return ^(UIColor * titleColor){
        self.emptyEntity.emptyTitleColor = titleColor;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(UIFont * _Nullable))emptyTitleFont {
    return ^(UIFont * titleFont){
        self.emptyEntity.emptyTitleFont = titleFont;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(NSString * _Nullable))emptyDetail {
    return ^(NSString * detail){
        self.emptyEntity.emptyDetail = detail;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(UIColor * _Nullable))emptyDetailColor {
    return ^(UIColor * detailColor){
        self.emptyEntity.emptyDetailColor = detailColor;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(UIFont * _Nullable))emptyDetailFont {
    return ^(UIFont * detailFont){
        self.emptyEntity.emptyDetailFont = detailFont;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(NSString * _Nullable))emptyLoadingTitle {
    return ^(NSString * title){
        self.emptyEntity.emptyLoading = title;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(UIColor * _Non_Nullablenull))emptyLoadingColor {
    return ^(UIColor * loadingColor){
        self.emptyEntity.emptyLoadingColor = loadingColor;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(UIFont * _Nullable))emptyLoadingFont {
    return ^(UIFont * loadingFont){
        self.emptyEntity.emptyLoadingFont = loadingFont;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(CGSize))emptyImageMaxSize {
    return ^(CGSize maxSize){
        self.emptyEntity.emptyImageMaxSize = maxSize;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(KKEmptyViewLoadingPosition))emptyLoadingPosition {
    return ^(KKEmptyViewLoadingPosition position){
        self.emptyEntity.loadingPosition = position;
        return self;
    };
}

- (KKEmptyEntityCreator * _Nonnull (^)(NSString * _Nullable, NSString * _Nullable, NSString * _Nullable))errorNotice {
    return ^(NSString * imageName, NSString * title, NSString * detail){
        self.emptyEntity.errorImageName = imageName;
        self.emptyEntity.errorTitle     = title;
        self.emptyEntity.errorDetail    = detail;
        return self;
    };
}
@end
