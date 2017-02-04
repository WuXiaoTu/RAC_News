//
//  LoginController.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import "LoginController.h"
#import "LoginView.h"
#import "LoginViewModel.h"

@interface LoginController ()
@property(nonatomic,strong)LoginView *loginView;
@property(nonatomic,strong)LoginViewModel *viewModel;
@end

@implementation LoginController
-(LoginView *)loginView{
    
    if (!_loginView) {
        
        _loginView = [[LoginView alloc]init];
    }
    
    return _loginView;
}

-(LoginViewModel *)viewModel{
    
    if (!_viewModel) {
        
        _viewModel = [[LoginViewModel alloc]init];
    }
    
    return _viewModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpLoginView];
    [self registLoginEvent];

}
-(void)setUpLoginView{
    
    self.loginView.frame = CGRectMake(0, 0, S_SCREEN_WIDTH, S_SCREEN_HEIGHT);
    [self.view addSubview:self.loginView];
    
}

- (void)registLoginEvent {
    
    @weakify(self);
    RAC(self.viewModel, userName) = self.loginView.userNameTextfield.rac_textSignal;
    RAC(self.viewModel, password) = self.loginView.passWordTextfield.rac_textSignal;
    
    self.loginView.loginButton.rac_command = self.viewModel.loginCommand;
    
    RAC(self.loginView.loginButton,backgroundColor) = [self.viewModel.loginBtnEnable map:^id(NSNumber * value) {
        return [value boolValue] ? [UIColor redColor] : [UIColor grayColor];
    }];
    
    [self.viewModel.loginBtnEnable subscribeNext:^(NSNumber * value) {
        @strongify(self);
        self.loginView.loginButton.enabled = [value boolValue];
    }];
    
    [[self.viewModel.loginCommand executionSignals]
     subscribeNext:^(RACSignal *x) {

         [x subscribeNext:^(NSString *x) {
             @strongify(self);
             [self.navigationController popViewControllerAnimated:YES];
         }];
     }];
    
    
    [self.loginView.userNameTextfield.rac_textSignal subscribeNext:^(NSString * x){
        
        static NSInteger const maxIntegerlength = 11;
        if (x.length) {
            if (x.length > 11) {
                @strongify(self);
                self.loginView.userNameTextfield.text = [self.loginView.userNameTextfield.text substringToIndex:maxIntegerlength];
            }
            
        }
    }];
    
    [self.loginView.passWordTextfield.rac_textSignal subscribeNext:^(NSString * x){
        
        static NSInteger const maxIntegerlength = 20;
        if (x.length) {
            if (x.length > 20) {
                @strongify(self);
                self.loginView.passWordTextfield.text = [self.loginView.passWordTextfield.text substringToIndex:maxIntegerlength];
            }
            
        }
    }];


}

@end
