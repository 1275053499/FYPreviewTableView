//
//  FYPreviewTableView.m
//  FYPreviewTableView
//
//  Created by xfy on 2018/4/9.
//  Copyright © 2018年 xfy. All rights reserved.
//
#import "FYPreviewTableView.h"
@implementation FYPreviewTableView
- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.dataSource = self;
    }
    return self;
}

- (id)init
{
    if (self = [super init]) {
        self.dataSource = self;
    }
    return self;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(fYPreviewTableView:numberOfRowsInSection:)]) {
        if ([self.fyDataSoure fYPreviewTableView:tableView numberOfRowsInSection:section] == 0) {
            return _previewCellCount?_previewCellCount:10;
        } else {
            return  [self.fyDataSoure fYPreviewTableView:tableView numberOfRowsInSection:section];
        }
    }
    return _previewCellCount?_previewCellCount:10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(fYPreviewTableView:numberOfRowsInSection:)] && [self.fyDataSoure fYPreviewTableView:tableView numberOfRowsInSection:indexPath.section] == 0 && [self.fyDataSoure respondsToSelector:@selector(registerCell)]) {
        
         UITableViewCell *cell = [self.fyDataSoure registerCell];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        for (UIView *s in cell.contentView.subviews) {
            
            if ([s isKindOfClass:[UILabel class]]) {
                ((UILabel *)s).text = @" ";
            }
            s.backgroundColor = _previewCellDefaultColor?_previewCellDefaultColor:[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
        }
         return cell;
        
    } else {
        if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(fYPreviewTableView:cellForRowAtIndexPath:)]) {
            UITableViewCell *cell = [self.fyDataSoure fYPreviewTableView:tableView cellForRowAtIndexPath:indexPath];
            for (UIView *s in cell.contentView.subviews) {
                s.backgroundColor = [UIColor whiteColor];
            }
            return cell;
        }
    }
    return [UITableViewCell new];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(numberOfSectionsInFYPreviewTableView:)]) {
        return  [self.fyDataSoure numberOfSectionsInFYPreviewTableView:tableView];
    }
    return 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(fYPreviewTableView:titleForHeaderInSection:)]) {
        return [self.fyDataSoure fYPreviewTableView:tableView titleForHeaderInSection:section];
    }
    return nil;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(fYPreviewTableView:titleForFooterInSection:)]) {
        return [self.fyDataSoure fYPreviewTableView:tableView titleForFooterInSection:section];
    }
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(fYPreviewTableView:canEditRowAtIndexPath:)]) {
        return [self.fyDataSoure fYPreviewTableView:tableView canEditRowAtIndexPath:indexPath];
    }
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(fYPreviewTableView:canMoveRowAtIndexPath:)]) {
        return [self.fyDataSoure fYPreviewTableView:tableView canMoveRowAtIndexPath:indexPath];
    }
    return NO;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(sectionIndexTitlesForFYPreviewTableView:)]) {
        return [self.fyDataSoure sectionIndexTitlesForFYPreviewTableView:tableView];
    }
    return [NSArray new];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(fYPreviewTableView:sectionForSectionIndexTitle:atIndex:)]) {
        return [self.fyDataSoure fYPreviewTableView:tableView sectionForSectionIndexTitle:title atIndex:index];
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(fYPreviewTableView:commitEditingStyle:forRowAtIndexPath:)]) {
         [self.fyDataSoure fYPreviewTableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if (self.fyDataSoure && [self.fyDataSoure respondsToSelector:@selector(fYPreviewTableView:moveRowAtIndexPath:toIndexPath:)]) {
        [self.fyDataSoure fYPreviewTableView:tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    }
}
@end
