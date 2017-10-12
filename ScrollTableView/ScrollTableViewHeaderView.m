//
//  ScrollTableViewHeaderView.m
//  ScrollTableView
//
//  Created by 孙晓康 on 2017/8/2.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "ScrollTableViewHeaderView.h"

@interface ScrollTableViewHeaderView()
@end

#define TITLELABELWIDTH 90
@implementation ScrollTableViewHeaderView

- (instancetype)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)titleArr {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [self createScrollTableViewHeaderWithTitleArr:titleArr];
    }
    
    return self;
}

- (void)createScrollTableViewHeaderWithTitleArr:(NSArray *)titleArr {
    
    
    NSInteger i = 0;
    for (NSString *titleStr in titleArr) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(i*TITLELABELWIDTH, 0, TITLELABELWIDTH, self.bounds.size.height)];
        
        titleLabel.font = [UIFont systemFontOfSize:13.0];
        titleLabel.numberOfLines = 0;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        titleLabel.text = titleStr;
        
        titleLabel.textColor = [UIColor blackColor];
        
        [self addSubview:titleLabel];
        
        i++;
    }
}



@end
