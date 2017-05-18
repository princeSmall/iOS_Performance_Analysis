//
//  ViewController.m
//  性能分析
//
//  Created by tongle on 2017/5/18.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static NSString * cellIndentifer = @"cell";
static NSString * headerIndentifier = @"headerCell";
static NSString * footerIndentifier = @"footerCell";


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor =[UIColor whiteColor];
    
    //给view加shadow
    UIView * shadowView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 50, 100)];
    shadowView.backgroundColor = [UIColor grayColor];
    shadowView.layer.shadowOffset = CGSizeMake(-1.0f, 1.0f);
    shadowView.layer.shadowRadius = 5.0f;
    shadowView.layer.shadowOpacity = 0.5;
   
    //替代
    shadowView.layer.shadowPath = [[UIBezierPath bezierPathWithRect:shadowView.bounds]CGPath];
     shadowView.layer.shadowOpacity = 0.5;
    [self.view addSubview:shadowView];
}
+(void)autoreleasepool{
    NSArray * urlArray = @[@"www.baidu.com",@"www.sohu.com",@"...."];
    for (NSURL * url in urlArray) {
        @autoreleasepool {
            NSError * error;
            NSString * files = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
            NSLog(@"%@",files);
        }
    }
}
+(UIImage*)getSubImage:(unsigned long)ulUserHeader
{
    UIImage * sourceImage = [UIImage imageNamed:@"header.png"];
    CGFloat height = sourceImage.size.height;
    CGRect rect = CGRectMake(0 + ulUserHeader*height, 0, height, height);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([sourceImage CGImage], rect);
    UIImage* smallImage = [UIImage imageWithCGImage:imageRef];
//    CGImageRelease(imageRef);
    
    return smallImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
