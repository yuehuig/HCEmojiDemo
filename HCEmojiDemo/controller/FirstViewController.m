//
//  FirstViewController.m
//  HCEmojiDemo
//
//  Created by Caoyq on 16/5/5.
//  Copyright © 2016年 honeycao. All rights reserved.
//

#import "FirstViewController.h"
#import "HCInputBar.h"

@interface FirstViewController ()
@property (strong, nonatomic) HCInputBar *inputBar;
@property (strong, nonatomic) UITextView *textWindow;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.navigationItem.title = @"聊天中";
    self.view.backgroundColor = [UIColor whiteColor];
    //添加用于显示表情和文字的textview
    [self.view addSubview:self.textWindow];
    //添加输入框键盘模块
    [self.view addSubview:self.inputBar];
    //块传值
    __weak typeof(self) weakSelf = self;
    [_inputBar showInputViewContents:^(NSString *contents) {
        weakSelf.textWindow.text = contents;
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (HCInputBar *)inputBar {
    if (!_inputBar) {
        if (_row == 0) {
            _inputBar = [[HCInputBar alloc]initWithStyle:DefaultInputBarStyle];
        }else{
            _inputBar = [[HCInputBar alloc]initWithStyle:ExpandingInputBarStyle];
            _inputBar.expandingAry = @[[NSNumber numberWithInteger:ImgStyleWithEmoji],[NSNumber numberWithInteger:ImgStyleWithVideo],[NSNumber numberWithInteger:ImgStyleWithPhoto],[NSNumber numberWithInteger:ImgStyleWithCamera],[NSNumber numberWithInteger:ImgStyleWithVoice]];
        }
        _inputBar.keyboard.showAddBtn = NO;
        [_inputBar.keyboard addBtnClicked:^{
            NSLog(@"我点击了添加按钮");
        }];
        _inputBar.placeHolder = @"输入新消息";
    }
    return _inputBar;
}
//- (void)dealloc {
//    _inputBar.keyboard = nil;
//}

- (UITextView *)textWindow {
    if (!_textWindow) {
        _textWindow = [[UITextView alloc]initWithFrame:CGRectMake(10, 84,CGRectGetWidth(self.view.frame)-20 , 80)];
        _textWindow.text = @"发送的文字及表情显示在这里";
        _textWindow.layer.cornerRadius = 10;
        _textWindow.layer.masksToBounds = YES;
        _textWindow.layer.borderWidth = 1;
        _textWindow.font = [UIFont systemFontOfSize:15];
        _textWindow.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    }
    return _textWindow;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_inputBar.inputView resignFirstResponder];
}

@end
