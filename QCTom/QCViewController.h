//
//  QCViewController.h
//  QCTom
//
//  Created by “ 邵鹏 on 14-5-22.
//  Copyright (c) 2014年 Scasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QCViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *tom;
//- (IBAction)fangpi:(UIButton *)sender;
//- (IBAction)pie:(UIButton *)sender;
//- (IBAction)zhua:(UIButton *)sender;

- (IBAction)btnClick:(UIButton *)sender;
@end
