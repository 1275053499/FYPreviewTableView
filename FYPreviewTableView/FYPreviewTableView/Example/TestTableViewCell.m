//
//  TestTableViewCell.m
//  FYPreviewTableView
//
//  Created by xfy on 2018/4/9.
//  Copyright © 2018年 xfy. All rights reserved.
//

#import "TestTableViewCell.h"
#import "Masonry.h"
@interface TestTableViewCell()
{
    UILabel *lbl1;
    UILabel *lbl2;
    UILabel *lbl3;
}
@end
@implementation TestTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        lbl1 = [[UILabel alloc] init];
        lbl1.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:lbl1];
        [lbl1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
        }];
        
        lbl2 = [[UILabel alloc] init];
        lbl2.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:lbl2];
        [lbl2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lbl1.mas_bottom).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
        }];
        
        lbl3 = [[UILabel alloc] init];
        lbl3.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:lbl3];
        [lbl3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lbl2.mas_bottom).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
        }];
    }
    return self;
}

- (void)updata:(NSString *)str
{
    lbl1.text = str;
    lbl2.text = str;
    lbl3.text = str;
}
@end
