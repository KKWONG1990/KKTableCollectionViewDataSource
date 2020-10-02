//
//  KKTableViewDataSource.m
//  KKTableView
//
//  Created by KKWONG on 2020/9/8.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import "KKTableViewDataSource.h"

@implementation KKTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionCreators.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sectionCreators objectAtIndex:section].section.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:indexPath.section];
    id cell = [tableView dequeueReusableCellWithIdentifier:sectionCreator.section.identifier forIndexPath:indexPath];
    if (sectionCreator.section.cellForRowCallBack) {
        sectionCreator.section.cellForRowCallBack(cell,
                                               [sectionCreator.section.datasource objectAtIndex:indexPath.row],
                                               indexPath);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:indexPath.section];
    if (sectionCreator.section.willDisplayCellCallBack) {
        sectionCreator.section.willDisplayCellCallBack(cell,
                                                       [sectionCreator.section.datasource objectAtIndex:indexPath.row],
                                                       indexPath);
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:indexPath.section];
    if (sectionCreator.section.didEndDisplayingCellCallBack) {
        sectionCreator.section.didEndDisplayingCellCallBack(cell,
                                                            [sectionCreator.section.datasource objectAtIndex:indexPath.row],
                                                            indexPath);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:section];
    if (sectionCreator.section.willDisplayHeaderViewCallBack) {
        sectionCreator.section.willDisplayHeaderViewCallBack(view, section);
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:section];
    if (sectionCreator.section.didEndDisplayingHeaderViewCallBack) {
        sectionCreator.section.didEndDisplayingHeaderViewCallBack(view, section);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:section];
    if (sectionCreator.section.willDisplayFooterViewCallBack) {
        sectionCreator.section.willDisplayFooterViewCallBack(view, section);
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:section];
    if (sectionCreator.section.didEndDisplayingFooterViewCallBack) {
        sectionCreator.section.didEndDisplayingFooterViewCallBack(view, section);
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.sectionCreators objectAtIndex:section].section.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self.sectionCreators objectAtIndex:section].section.footerTitle;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self.sectionCreators objectAtIndex:section].section.headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self.sectionCreators objectAtIndex:section].section.footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.sectionCreators objectAtIndex:indexPath.section].section.rowHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self.sectionCreators objectAtIndex:section].section.headerHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [self.sectionCreators objectAtIndex:section].section.footerHeight;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:indexPath.section];
    if (sectionCreator.section.willSelectRowCallBack) {
        sectionCreator.section.willSelectRowCallBack([sectionCreator.section.datasource objectAtIndex:indexPath.row], indexPath);
    }
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:indexPath.section];
    if (sectionCreator.section.didSelectRowCallBack) {
        sectionCreator.section.didSelectRowCallBack([sectionCreator.section.datasource objectAtIndex:indexPath.row], indexPath);
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:indexPath.section];
    if (sectionCreator.section.willDeselectRowCallBack) {
        sectionCreator.section.willDeselectRowCallBack([sectionCreator.section.datasource objectAtIndex:indexPath.row], indexPath);
    }
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:indexPath.section];
    if (sectionCreator.section.didDeselectRowCallBack) {
        sectionCreator.section.didDeselectRowCallBack([sectionCreator.section.datasource objectAtIndex:indexPath.row], indexPath);
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.sectionIndexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return 1;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.sectionCreators objectAtIndex:indexPath.section].section.editingStyle;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:indexPath.section];
    if (sectionCreator.section.commitEditingStyleCallBack) {
        sectionCreator.section.commitEditingStyleCallBack(editingStyle, indexPath);
    }
}

//- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath  API_AVAILABLE(ios(11.0)){
    KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:indexPath.section];
    BOOL isHasContextualActionCreators = sectionCreator.section.trailingContextualActionCreators && sectionCreator.section.trailingContextualActionCreators.count;
    if (isHasContextualActionCreators) {
        NSMutableArray * actionArray = [NSMutableArray arrayWithCapacity:sectionCreator.section.trailingContextualActionCreators.count];
        for (KKContextualActionCreator * creator in sectionCreator.section.trailingContextualActionCreators) {
            UIContextualAction * action = [UIContextualAction contextualActionWithStyle:creator.contextualActionData.style
                                                                                  title:creator.contextualActionData.title
                                                                                handler:^(UIContextualAction * _Nonnull action,
                                                                                          __kindof UIView * _Nonnull sourceView,
                                                                                          void (^ _Nonnull completionHandler)(BOOL)) {
                if (creator.contextualActionData.actionCallBack) {
                    creator.contextualActionData.actionCallBack(indexPath);
                }
                completionHandler(YES);
            }];
            action.backgroundColor = creator.contextualActionData.backgroundColor;
            action.image           = creator.contextualActionData.image;
            [actionArray addObject:action];
        }
        UISwipeActionsConfiguration *configuration = [UISwipeActionsConfiguration configurationWithActions:(NSArray *)actionArray];
        configuration.performsFirstActionWithFullSwipe = NO;
        return configuration;
    }
    return nil;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath  API_AVAILABLE(ios(11.0)){
   KKSectionCreator * sectionCreator = [self.sectionCreators objectAtIndex:indexPath.section];
    BOOL isHasContextualActionCreators = sectionCreator.section.leadingContextualActionCreators && sectionCreator.section.leadingContextualActionCreators.count;
    if (isHasContextualActionCreators) {
        NSMutableArray * actionArray = [NSMutableArray arrayWithCapacity:sectionCreator.section.leadingContextualActionCreators.count];
        for (KKContextualActionCreator * creator in sectionCreator.section.leadingContextualActionCreators) {
            UIContextualAction * action = [UIContextualAction contextualActionWithStyle:creator.contextualActionData.style
                                                                                  title:creator.contextualActionData.title
                                                                                handler:^(UIContextualAction * _Nonnull action,
                                                                                          __kindof UIView * _Nonnull sourceView,
                                                                                          void (^ _Nonnull completionHandler)(BOOL)) {
                if (creator.contextualActionData.actionCallBack) {
                    creator.contextualActionData.actionCallBack(indexPath);
                }
                completionHandler(YES);
            }];
            action.backgroundColor = creator.contextualActionData.backgroundColor;
            action.image           = creator.contextualActionData.image;
            [actionArray addObject:action];
        }
        UISwipeActionsConfiguration *configuration = [UISwipeActionsConfiguration configurationWithActions:(NSArray *)actionArray];
        configuration.performsFirstActionWithFullSwipe = NO;
        return configuration;
    }
    return nil;
}

- (NSMutableArray<KKSectionCreator *> *)sectionCreators {
    if (!_sectionCreators) {
        _sectionCreators = [NSMutableArray array];
    }
    return _sectionCreators;
}
@end
