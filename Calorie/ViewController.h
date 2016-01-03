//
//  ViewController.h
//  Calorie
//
//  Created by 程嘉雯 on 16/1/1.
//  Copyright © 2016年 com.epoluodi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *kj;
@property (weak, nonatomic) IBOutlet UITextField *unit;
@property (weak, nonatomic) IBOutlet UITextField *weight;


@property (weak, nonatomic) IBOutlet UITextField *cal;
@property (weak, nonatomic) IBOutlet UIButton *btn1;

- (IBAction)clickbtn:(id)sender;

@end

