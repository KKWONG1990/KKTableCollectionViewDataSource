//
//  KKSectionCretor.m
//  KKTableView
//
//  Created by KKWONG on 2020/9/9.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import "KKSectionCreator.h"

@implementation KKSectionCreator
- (instancetype)init {
    if (self) {
        _section = [KKSection new];
    }
    return self;
}

+ (KKSectionCreator * _Nonnull (^)(void))init {
    return ^{
        return [[self alloc] init];
    };
}

- (KKSectionCreator * _Nonnull (^)(NSString * _Nullable))headerTitle {
    return ^(NSString * headerTitle) {
        self.section.headerTitle = headerTitle;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(NSString * _Nullable))footerTitle {
    return ^(NSString * footerTitle) {
        self.section.footerTitle = footerTitle;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(UIView * _Nullable))headerView {
    return ^(UIView * headerView){
        self.section.headerView = headerView;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(UIView * _Nullable))footerView {
    return ^(UIView * footerView){
        self.section.footerView = footerView;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(CGFloat))headerHeight {
    return ^(CGFloat headerHeight){
        self.section.headerHeight = headerHeight;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(CGFloat))footerHeight {
    return ^(CGFloat footerHeight){
        self.section.footerHeight = footerHeight;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(CGFloat))rowHeight {
    return ^(CGFloat rowHeight){
        self.section.rowHeight = rowHeight;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(NSArray * _Nullable))datasource {
    return ^(NSArray * datasource){
        self.section.datasource = datasource;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(Class  _Nonnull __unsafe_unretained))cellClass {
    return ^(Class cellClass){
        self.section.cellClass = cellClass;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(UINib * _Nonnull))cellNib {
    return ^(UINib * cellNib){
        self.section.cellNib = cellNib;
        return self;
    };
}

//- (KKSectionCreator * _Nonnull (^)(NSString * _Nonnull))cellName {
//    return ^(NSString * cellName){
//        self.section.cellName = cellName;
//        return self;
//    };
//}

- (KKSectionCreator * _Nonnull (^)(NSString * _Nonnull))identifier {
    return ^(NSString * identifier){
        self.section.identifier = identifier;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(RowCallBack _Nonnull))cellForRowBlock {
    return ^(RowCallBack cellForRowBlock){
        self.section.cellForRowCallBack = cellForRowBlock;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(SelectedCallBack _Nonnull))didSelectRowAtIndexPath {
    return ^(SelectedCallBack selectedCallBack) {
        self.section.didSelectRowCallBack = selectedCallBack;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(HeaderFooterViewCallBack _Nonnull))headerFooterView {
    return ^(HeaderFooterViewCallBack callback) {
        self.section.headerFooterViewCallBack = callback;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(CommitEditingStyleCallBack _Nonnull))commitEditingStyle {
    return ^(CommitEditingStyleCallBack callback) {
        self.section.commitEditingStyleCallBack = callback;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(NSArray<NSString *> * _Nonnull))sectionIndexTitles {
    return ^(NSArray<NSString *> * titles){
        self.section.indexTitles = titles;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(UITableViewCellEditingStyle))editingStyle {
    return ^(UITableViewCellEditingStyle editingStyle){
        self.section.editingStyle = editingStyle;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(NSArray<KKContextualActionCreator *> * _Nonnull))trailingContextualActionCreator {
    return ^(NSArray<KKContextualActionCreator *> * creators){
        self.section.trailingContextualActionCreators = creators;
        return self;
    };
}

- (KKSectionCreator * _Nonnull (^)(NSArray<KKContextualActionCreator *> * _Nonnull))leadingContextualActionCreator {
    return ^(NSArray<KKContextualActionCreator *> * creators){
        self.section.leadingContextualActionCreators = creators;
        return self;
    };
}

@end
