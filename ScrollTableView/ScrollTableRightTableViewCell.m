//
//  ScrollTableRightTableViewCell.m
//  ScrollTableView
//
//  Created by 孙晓康 on 2017/8/3.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "ScrollTableRightTableViewCell.h"

#import "Masonry.h"

#define LABELWIDTH 90

@interface ScrollTableRightTableViewCell()

@property (nonatomic, strong) NSMutableArray *labelArr;

@end

@implementation ScrollTableRightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _labelArr = [[NSMutableArray alloc] init];
        
        [self addLabelToRightTable];
    }
    
    return self;
}


- (void)addLabelToRightTable {
    
    for (int i = 0; i<7; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] init];
        
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        
        titleLabel.backgroundColor = [UIColor colorWithRed:rand()%255/255.0 green:rand()%255/255.0 blue:rand()%255/255.0 alpha:1];
        
     //   titleLabel.frame = CGRectMake(i*LABELWIDTH, 0, LABELWIDTH, self.contentView.bounds.size.height);
        [self.contentView addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.contentView.mas_left).offset(i*LABELWIDTH);
            make.width.equalTo(@LABELWIDTH);
            make.top.equalTo(self.contentView.mas_top);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        
        [_labelArr addObject:titleLabel];
    }

}

#if 0
- (void)setCellLabelCount:(NSInteger)cellLabelCount {
    
    for (int i = 0; i<cellLabelCount; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] init];
        
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        titleLabel.backgroundColor = [UIColor colorWithRed:rand()%255/255.0 green:rand()%255/255.0 blue:rand()%255/255.0 alpha:1];
        
        titleLabel.frame = CGRectMake(i*LABELWIDTH, 0, LABELWIDTH, self.contentView.bounds.size.height);
        [self.contentView addSubview:titleLabel];
        
        [_labelArr addObject:titleLabel];
    }
}

#endif
- (void)setCellDataArr:(NSArray *)cellDataArr {
    
    NSInteger i = 0;
    
    for (NSString *titleStr in cellDataArr) {
        
        UILabel *titleLabel = _labelArr[i];
        i++;
        titleLabel.text = titleStr;
    }
}

@end
