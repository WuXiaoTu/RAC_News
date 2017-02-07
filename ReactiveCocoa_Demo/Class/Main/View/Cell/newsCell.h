//
//  newsCell.h
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "newsModel.h"

@interface newsCell : UITableViewCell

@property (nonatomic, strong) UILabel     * content;
@property (nonatomic, strong) UILabel     * title;
@property (nonatomic, strong) UIImageView * samllImg;
@property (nonatomic, strong) newsModel   * model;
@end
