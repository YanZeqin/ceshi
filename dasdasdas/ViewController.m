//
//  ViewController.m
//  dasdasdas
//
//  Created by 泽秦  严 on 2017/6/27.
//  Copyright © 2017年 泽秦  严. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Cat.h"
#import "Aspects.h"
@interface ViewController ()
{
    int flag;
}
@property (weak, nonatomic) IBOutlet UIButton *kButton;
@property (weak, nonatomic) IBOutlet UILabel *klabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    flag = 60;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getInternetface) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
//    [[NSRunLoop currentRunLoop]run];

    Class catMetal = objc_getMetaClass(NSStringFromClass(Cat.class).UTF8String);
    [catMetal aspect_hookSelector:@selector(classFee) withOptions:AspectPositionAfter usingBlock:^(id aspectInfo){
        NSLog(@"aspectFee");
    } error:NULL];
    [Cat classFee];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)getInternetface{
    flag--;
//    NSLog(@"%d", flag);
//    _klabel.text = [NSString stringWithFormat:@"%d",flag];
//    [_kButton setTitle: [NSString stringWithFormat:@"%d",flag] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
