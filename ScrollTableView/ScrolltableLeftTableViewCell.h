//
//  ScrolltableLeftTableViewCell.h
//  ScrollTableView
//
//  Created by 孙晓康 on 2017/8/2.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrolltableLeftTableViewCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@property(nonatomic, strong) NSString *rankStr;
@property(nonatomic, strong) NSString *imageName;

@end
