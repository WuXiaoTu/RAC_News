//
//  newsCell.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import "newsCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIView+SDAutoLayout.h"
#import "UIImageView+WebCache.h"

@implementation newsCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.samllImg.sd_layout
        .leftSpaceToView(self.contentView,10)
        .topSpaceToView(self.contentView,10)
        .widthIs(80)
        .heightIs(80);
        @weakify(self);
        [RACObserve(self, model)subscribeNext:^(newsModel * model) {
            @strongify(self);
            [self.samllImg sd_setImageWithURL:[NSURL URLWithString:model.sallimg]];
            [self.samllImg setHidden:[model.sallimg isEqualToString:@""]];
            [self.content setText:model.content];
            [self.title setText:model.title];
        }];
    }
    return self;
}

- (UILabel*)content {
    if (!_content) {
        _content = [[UILabel alloc]init];
        _content.numberOfLines = 0;
        _content.font = [UIFont fontWithName:@"MicrosoftYaHei" size:12];
        _content.textColor = [UIColor grayColor];
        [self.contentView addSubview:_content];
    }
    return _content;
}
- (UILabel*)title {
    if (!_title) {
        _title = [[UILabel alloc]init];
        _title.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];
        _title.textColor = [UIColor blackColor];
        [self.contentView addSubview:_title];
    }
    return _title;
}

- (UIImageView*)samllImg {
    if (!_samllImg) {
        _samllImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_samllImg];
    }
    return _samllImg;
}

- (void)layoutSubviews {
    [self.title sd_resetLayout];
    [self.content sd_resetLayout];
    id x = _samllImg.hidden ? self.contentView : _samllImg;
    self.title.sd_layout.leftSpaceToView(x,10)
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .heightIs(20);
    self.content.sd_layout
    .leftSpaceToView(x,10)
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(self.title,5)
    .bottomSpaceToView(self.contentView,5);
    [super layoutSubviews];
}
@end
