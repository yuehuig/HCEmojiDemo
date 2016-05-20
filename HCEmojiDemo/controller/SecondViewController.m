//
//  SecondViewController.m
//  HCEmojiDemo
//
//  Created by Caoyq on 16/5/9.
//  Copyright © 2016年 honeycao. All rights reserved.
//

#import "SecondViewController.h"
#import "HCEmojiKeyboard.h"

static NSString *emoji = @"Resources.bundle/emoji";
static NSString *keyboard = @"Resources.bundle/keyboard";

@interface SecondViewController ()
@property (strong, nonatomic) UITextView *textWindow;
@property (strong, nonatomic) HCEmojiKeyboard *emojiKeyboard;
@property (strong, nonatomic) UILabel *showLab;
@end

@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"聊天";
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    _showLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 74, [UIScreen mainScreen].bounds.size.width - 20, 30)];
    _showLab.text = @"点击发送之后，输入框内容出现在这里";
    [self.view addSubview:_showLab];
    
    _textWindow = [[UITextView alloc]initWithFrame:CGRectMake(10, 114,[UIScreen mainScreen].bounds.size.width - 20 , 100)];
    _textWindow.layer.cornerRadius = 10;
    _textWindow.layer.masksToBounds = YES;
    _textWindow.layer.borderWidth = 1;
    _textWindow.font = [UIFont systemFontOfSize:15];
    _textWindow.layer.borderColor = [[UIColor colorWithWhite:0 alpha:0.5] CGColor];
    _textWindow.tag = 0;
    [self.view addSubview:_textWindow];

    UIButton *faceBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 182, 32, 32)];
    faceBtn.tag = 0;
    [faceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [faceBtn setBackgroundImage:[UIImage imageNamed:emoji] forState:UIControlStateNormal];
    [faceBtn addTarget:self action:@selector(clickedFaceBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:faceBtn];
    
    [self createEmojiView];
    
}

- (void)createEmojiView {

    _emojiKeyboard = [HCEmojiKeyboard sharedKeyboard];
    _emojiKeyboard.showAddBtn = YES;
    [_emojiKeyboard addBtnClicked:^{
        NSLog(@"clicked add btn");
    }];
    [_emojiKeyboard sendEmojis:^{
        //赋值
        _showLab.text = _textWindow.text;
    }];
}

//改变键盘状态
- (void)clickedFaceBtn:(UIButton *)button{
    if (button.tag == 1){
        self.textWindow.inputView = nil;
        [button setBackgroundImage:[UIImage imageNamed:emoji] forState:UIControlStateNormal];
    }else{
        [button setBackgroundImage:[UIImage imageNamed:keyboard] forState:UIControlStateNormal];
        [_emojiKeyboard setTextInput:self.textWindow];
    }
    [self.textWindow reloadInputViews];
    button.tag = (button.tag+1)%2;
    [_textWindow becomeFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textWindow resignFirstResponder];
}
@end
