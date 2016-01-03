//
//  ViewController.m
//  Calorie
//
//  Created by 程嘉雯 on 16/1/1.
//  Copyright © 2016年 com.epoluodi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize cal;
@synthesize kj;
@synthesize unit;
@synthesize btn1;
@synthesize weight;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *gestap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeinput)];
    [self.view addGestureRecognizer:gestap];
}


-(void)closeinput
{
    [kj resignFirstResponder];
    [cal resignFirstResponder];
    [unit resignFirstResponder];
    [weight resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickbtn:(id)sender {
    
    
    float funit = [unit.text floatValue];
    float fkj = [kj.text floatValue];
    float fweight = [weight.text floatValue];
    
    float b = fweight / funit;
    float kcal = fkj / 4.184f;
    float fcal = kcal *b;
    cal.text = [NSString stringWithFormat:@"%f",fcal];
    
}
@end
