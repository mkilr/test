//
//  QCViewController.m
//  QCTom
//
//  Created by “ 邵鹏 on 14-5-22.
//  Copyright (c) 2014年 Scasy. All rights reserved.
//

#import "QCViewController.h"

@interface QCViewController ()
{
    NSDictionary *_dict; // 保存所有图片的个数
}
@end

@implementation QCViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.获得tom.plist的全路径
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"tom" ofType:@"plist"];
    
    // 2.根据文件路径加载字典
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    
}

//- (IBAction)fangpi:(UIButton *)sender {
//    [self playAnim:28 fliename:@"fart"];
//}
//
//- (IBAction)pie:(UIButton *)sender {
//    [self playAnim:24 fliename:@"pie"];
//}
//
//- (IBAction)zhua:(UIButton *)sender {
//    [self playAnim:56 fliename:@"scratch"];
//}

- (void)playAnim:(int)count fliename:(NSString *)filename
{
    // 1.创建可变数组
    NSMutableArray *images = [NSMutableArray array];
    
    // 2.添加图片
    for (int i = 0; i<count; i++) {
        // 图片名
        NSString *name = [NSString stringWithFormat:@"%@_%02d.jpg", filename, i];
        // 全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        
        // 加载图片(缓存)
        //        UIImage *img = [UIImage imageNamed:name];
        // 没有缓存
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        
        [images addObject:img];
    }
    
    // 3.设置动画图片(有顺序)
    _tom.animationImages = images;// 序列帧动画
    
    // 4.只播放一次
    _tom.animationRepeatCount = 1;
    
    // 5.设置动画的持续时间
    _tom.animationDuration = 0.1 * count;
    
    // 5.开始动画
    [_tom startAnimating];
    
    
    //    // 1.有缓存（无法释放,参数传的是文件名）
    //    [UIImage imageNamed:@""];
    //
    //    // 2.无缓存（用完就会释放，参数传的是全路径）
    //    [[UIImage alloc] initWithContentsOfFile:];
}

#pragma mark 监听所有的按钮点击
- (IBAction)btnClick:(UIButton *)sender {
    // 1.如果tom正在播放动画，直接返回
    if (_tom.isAnimating) return;
    
    // 2.取出按钮文字
    NSString *title = [sender titleForState:UIControlStateNormal];
    
    // 3.获得图片数量
    int count = [_dict[title] intValue];
    
    // 4.播放动画
    [self playAnim:count fliename:title];
}

@end
