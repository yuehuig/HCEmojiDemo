# HCEmojiDemo
在系统键盘上添加的一个表情键盘，类型和功能差不多和微信、qq类似，做到了和系统键盘真正相容，低耦合度，且调用简单，全封装，接口清晰，代码易懂。
![image](https://github.com/honeycao/ScanDemo/blob/master/HCEmoji.gif) 
------

##导航
1、[功能](https://github.com/honeycao/HCEmojiDemo#)

2、[使用方法](https://github.com/honeycao/HCEmojiDemo#使用方法)

3、[Demo使用](https://github.com/honeycao/HCEmojiDemo#Demo使用)

4、[后期改进](https://github.com/honeycao/HCEmojiDemo#后期改进)

5、[Q-A](https://github.com/honeycao/HCEmojiDemo#Q-A)

6、[备注](https://github.com/honeycao/HCEmojiDemo#备注)

------

##1、功能
* 键盘可放在不同位置调用，目前写了3中常用类型供参考
* 支持文字表情单独或混排输出
* 工具栏暂且写了2个功能，其中可记录使用过的表情
* 对于相机、视频接口已写好，由于越写越大，功能多难驾驭，暂且没有去实现

------

##2、使用方法
* 直接下载后将项目中的`HCEmoji`添加到自己项目中即可
* 全功能调用则包含头文件`#import "HCInputBar.h"`
* 只是单独调用一个表情功能则包含头文件`#import "HCEmojiKeyboard.h"`
* 接口调用，只是列出基本的使用，其他具体可以查看代码获知
```obj-c
//第一种类型，没有拓展栏
@property (strong, nonatomic) HCInputBar *inputBar;
_inputBar = [[HCInputBar alloc]initWithStyle:DefaultInputBarStyle];
[_inputBar showInputViewContents:^(NSString *contents) {
    //回传得到输入框中的文字和表情内容
}];
//可以自己设置是否在工具栏中显示添加按钮，默认为YES，如果设置为YES，则必须实现其回调方法
_inputBar.keyboard.showAddBtn = YES;
[_inputBar.keyboard addBtnClicked:^{
    
}];
//不设置背景文字则默认不显示
_inputBar.placeHolder = @"输入新消息";
```

//第二种类型，有拓展栏
```obj-c
@property (strong, nonatomic) HCInputBar *inputBar;
_inputBar = [[HCInputBar alloc]initWithStyle:ExpandingInputBarStyle];
//这里设置的是自定义拓展栏各个功能的摆放顺序，暂且只有5个功能对应的图片和接口
_inputBar.expandingAry = @[[NSNumber numberWithInteger:ImgStyleWithEmoji],[NSNumber numberWithInteger:ImgStyleWithVideo],[NSNumber numberWithInteger:ImgStyleWithPhoto],[NSNumber numberWithInteger:ImgStyleWithCamera],[NSNumber numberWithInteger:ImgStyleWithVoice]];
}
_inputBar.keyboard.showAddBtn = YES;
[_inputBar.keyboard addBtnClicked:^{

}];
_inputBar.placeHolder = @"输入新消息";
```

//仅用表情功能，且自定义位置
```obj-c
@property (strong, nonatomic) HCEmojiKeyboard *emojiKeyboard;
_emojiKeyboard = [HCEmojiKeyboard sharedKeyboard];
//可以自己设置是否在工具栏中显示添加按钮，默认为YES，如果设置为YES，则必须实现其回调方法
_emojiKeyboard.showAddBtn = YES;
[_emojiKeyboard addBtnClicked:^{

}];
[_emojiKeyboard sendEmojis:^{
    //表情键盘下的工具栏中的发送按钮是否被点击的回传，在这里可以设置自己的输入框的操作等
}];

```
------

##3、Demo使用
`controller`文件夹中是用于显示3中类型的界面；`HCEmoji`文件夹是表情代码和其他功能的集成

------

##4、后期改进
啰嗦几句：由于一开始只是想用一个表情，后来看到QQ和微信功能较大，才想着拓展来写，看起来简单，写起来就比较麻烦，遇坑无数，写给自己用也不难，主要是想着封装起来能调用，接口上废了好多时间，传值等没有做的太好，越写思路就有点局限了，所以对于拓展的功能：录音等暂且没写，也由于水平有限，一时不能全部添加完成，特此也希望一些会写的或者有思路的能指点指点，有问题也可以一起讨论一下啊，最后面有联系方式
* 后期功能能拓展的也挺多的，只能说慢慢来写

------

##5、Q-A
* 第一次运行有点击cell要反应好几秒，为什么？
我自己也发现在模拟器上连接调试首次运行点击的时候会卡个2s左右，然后用真机连着调试的时候情况也一样，但是在真机上安装好，拔掉线不用来调试，那么就一点问题都没有，所以真正运行在项目中是没有问题的，只有处于调试状态才会卡

------

##6、备注
>I am a rookie ，I am not God （有问题或有指教的请q：331864805 ，你的点赞是我最大的动力，谢谢）
