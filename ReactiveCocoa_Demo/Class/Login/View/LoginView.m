//
//  LoginView.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//
#define ALERTTITLE @"测试账号：18611446521\n密码：123456\n ReactiveCocoa + MVVM 本人也是刚接触RAC写的不好,还有很多东西不是很理解，还请大神们指教一起钻研学习。我的QQ 299814 欢迎👏指点。"
#import "LoginView.h"
#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
    

    [self addSubview:self.loginButton];
    [self addSubview:self.userNameTextfield];
    [self addSubview:self.passWordTextfield];
    [self addSubview:self.alertTitle];
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
}

-(void)updateConstraints{
    

    self.loginButton.sd_layout.topSpaceToView(self,150).leftSpaceToView(self,20).rightSpaceToView(self,20).heightIs(43);
    self.userNameTextfield.sd_layout.leftSpaceToView(self,20).topSpaceToView(self,50).rightSpaceToView(self,20).heightIs(30);
     self.passWordTextfield.sd_layout.leftSpaceToView(self,20).topSpaceToView(self,90).rightSpaceToView(self,20).heightIs(30);
        self.alertTitle.sd_layout.leftSpaceToView(self,20).topSpaceToView(self,200).rightSpaceToView(self,20).heightIs(120);
    [super updateConstraints];
}

-(UITextField *)userNameTextfield{
    
    if (!_userNameTextfield) {
        
        _userNameTextfield = [[UITextField alloc]init];
        _userNameTextfield.placeholder = @"请输入账号";
        _userNameTextfield.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];

        _userNameTextfield.backgroundColor = [UIColor whiteColor];
    }
    return _userNameTextfield;
    
}
-(UITextField *)passWordTextfield{
    
    if (!_passWordTextfield) {
        
        _passWordTextfield = [[UITextField alloc]init];
        _passWordTextfield.secureTextEntry = YES;
        _passWordTextfield.placeholder = @"请输入密码";
        _passWordTextfield.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];

        _passWordTextfield.backgroundColor = [UIColor whiteColor];

    }
    return _passWordTextfield;
}
-(UIButton *)loginButton{
    
    if (!_loginButton) {
        
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setBackgroundColor:[UIColor redColor]];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _loginButton;
}

- (UILabel*)alertTitle {
    if (!_alertTitle) {
        _alertTitle = [[UILabel alloc]init];
        _alertTitle.textColor = [UIColor blueColor];
        _alertTitle.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];
        _alertTitle.text = ALERTTITLE;
        _alertTitle.numberOfLines = 0;
    }
    return _alertTitle;
}
@end
