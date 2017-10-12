//
//  ScrollTableRightTableViewCell.h
//  ScrollTableView
//
//  Created by 孙晓康 on 2017/8/3.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollTableRightTableViewCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@property (nonatomic,assign) NSInteger cellLabelCount;
@property (nonatomic, strong) NSArray *cellDataArr;
@end
