//
//  ScrolltableLeftTableViewCell.m
//  ScrollTableView
//
//  Created by 孙晓康 on 2017/8/2.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "ScrolltableLeftTableViewCell.h"
#import "Masonry.h"

@interface ScrolltableLeftTableViewCell()

@property (nonatomic, strong) UIImageView *dotImageV;
@property (nonatomic, strong) UILabel *rankLabel;

@end

@implementation ScrolltableLeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self createScrollTableLeftCell];
    }
    
    return self;
}

- (void)createScrollTableLeftCell {
    
    UIImageView *dotImageV = [[UIImageView alloc]init];
    
    dotImageV.image = [UIImage imageNamed:@"raidobutton_blue"];
    
    _dotImageV = dotImageV;
    [self.contentView addSubview:dotImageV];
    
    [dotImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left).offset(25);
        make.size.mas_equalTo(CGSizeMake(8, 8));
        make.centerY.equalTo(self.contentView.mas_centerY);
        
    }];
    
    UILabel *rankLabel = [[UILabel alloc]init];
    rankLabel.font = [UIFont systemFontOfSize:12];
    rankLabel.textColor = [UIColor grayColor];
    rankLabel.backgroundColor = [UIColor colorWithRed:rand()%255/255.0 green:rand()%255/255.0 blue:rand()%255/255.0 alpha:1];
    _rankLabel = rankLabel;
    
    [self.contentView addSubview:rankLabel];
    [rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(dotImageV.mas_right).offset(5);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@40);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
}


- (void)setRankStr:(NSString *)rankStr {
    
    _rankLabel.text = rankStr;
}

- (void)setImageName:(NSString *)imageName {
    
    _dotImageV.image = [UIImage imageNamed:@"raidobutton_blue"];
}



@end
