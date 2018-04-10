//
//  FYPreviewTableView.h
//  FYPreviewTableView
//
//  Created by xfy on 2018/4/9.
//  Copyright © 2018年 xfy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FYPreviewTableViewDataSource<NSObject>

@required

- (NSInteger)fYPreviewTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)fYPreviewTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
/**
 返回一个需要显示的UITableViewCell实例
 */
- (UITableViewCell *)registerCell;
@optional
- (NSInteger)numberOfSectionsInFYPreviewTableView:(UITableView *)tableView;
// Default is 1 if not implemented

- (nullable NSString *)fYPreviewTableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;     // fixed font style. use custom view (UILabel) if you want something different

- (nullable NSString *)fYPreviewTableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;

// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)fYPreviewTableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)fYPreviewTableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;

// Index

- (nullable NSArray<NSString *> *)sectionIndexTitlesForFYPreviewTableView:(UITableView *)tableView;                               // return list of section titles to display in section index view (e.g. "ABCD...Z#")

- (NSInteger)fYPreviewTableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;  // tell table which section corresponds to section title/index (e.g. "B",1))

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (void)fYPreviewTableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

// Data manipulation - reorder / moving support

- (void)fYPreviewTableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;

@end

@interface FYPreviewTableView : UITableView
/*需要显示预览cell数量 默认显示10个*/
@property (nonatomic,assign)NSInteger previewCellCount;

/*需要显示占位控件颜色 默认[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1]*/
@property (nonatomic,strong)UIColor *previewCellDefaultColor;


/*必须实现此代理，代替tableView的dataSoure*/
@property (nonatomic,weak)id<FYPreviewTableViewDataSource> fyDataSoure;
@end
