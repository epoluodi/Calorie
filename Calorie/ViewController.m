//
//  ViewController.m
//  Calorie
//
//  Created by 程嘉雯 on 16/1/1.
//  Copyright © 2016年 com.epoluodi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIFont *font;
    BOOL isload;
}
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
    
    isload= NO;
    kj.clearsOnBeginEditing=YES;
    unit.clearsOnBeginEditing=YES;
    weight.clearsOnBeginEditing=YES;
    
    kj.tintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    unit.tintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    weight.tintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    
    weight.delegate=self;
//    kj.inputAccessoryView = [PublicCommon getInputToolbar:self sel:@selector(closeinput)];
////
//       unit.inputAccessoryView = [PublicCommon getInputToolbar:self sel:@selector(closeinput)];
//       weight.inputAccessoryView = [PublicCommon getInputToolbar:self sel:@selector(closeinput)];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!isload){
        [self initview];
        isload=YES;
    }
}

-(void)initview
{
    CGRect rect;
    CGSize fontsize;
    lcal = [[UILabel alloc] init];
    font = [UIFont fontWithName:@"HYShiGuangTiW" size:24];
    lcal.font = font;
    lcal.text=@"cal";
    fontsize = [lcal.text sizeWithFont:font];
    
   
    rect = CGRectMake([PublicCommon GetALLScreen].size.width/2 +65, cal.frame.origin.y + cal.frame.size.height - fontsize.height, fontsize.width, fontsize.height);
    
    lcal.frame = rect;
    lcal.textColor=[UIColor whiteColor];
    [self.view addSubview:lcal];
    

    
    lm = [[UILabel alloc] init];
    font = [UIFont fontWithName:@"HYShiGuangTiW" size:35];
    lm.font = font;
    lm.text=@"每";
    fontsize = [lm.text sizeWithFont:font];
    


    rect = CGRectMake(unit.frame.origin.x - fontsize.width-10, unit.frame.origin.y , fontsize.width, fontsize.height);

    lm.frame = rect;
    lm.textColor=[UIColor whiteColor];
    [self.view addSubview:lm];
    
    lg1 = [[UILabel alloc] init];
    font = [UIFont fontWithName:@"HYShiGuangTiW" size:35];
    lg1.font = font;
    lg1.text=@"g";
    fontsize = [lm.text sizeWithFont:font];
    
    
    
    rect = CGRectMake(unit.frame.origin.x + unit.frame.size.width +10, unit.frame.origin.y , fontsize.width, fontsize.height);
    
    lg1.frame = rect;
    lg1.textColor=[UIColor whiteColor];
    [self.view addSubview:lg1];
    
    
    

    lnl = [[UILabel alloc] init];
    font = [UIFont fontWithName:@"HYShiGuangTiW" size:35];
    lnl.font = font;
    lnl.text=@"能量";
    fontsize = [lnl.text sizeWithFont:font];
    
    
    
    rect = CGRectMake(kj.frame.origin.x - fontsize.width-10, kj.frame.origin.y , fontsize.width, fontsize.height);
    
    lnl.frame = rect;
    lnl.textColor=[UIColor whiteColor];
    [self.view addSubview:lnl];
    
    
    lkj = [[UILabel alloc] init];
    font = [UIFont fontWithName:@"HYShiGuangTiW" size:35];
    lkj.font = font;
    lkj.text=@"kj";
    fontsize = [lkj.text sizeWithFont:font];
    
    
    
    rect = CGRectMake(kj.frame.origin.x + kj.frame.size.width +10, kj.frame.origin.y , fontsize.width, fontsize.height);
    
    lkj.frame = rect;
    lkj.textColor=[UIColor whiteColor];
    [self.view addSubview:lkj];
    
    
    
    
    
    
    
    
    lcal = [[UILabel alloc] init];
    font = [UIFont fontWithName:@"HYShiGuangTiW" size:35];
    lcal.font = font;
    lcal.text=@"摄入量";
    fontsize = [lcal.text sizeWithFont:font];
    
    
    
    rect = CGRectMake(weight.frame.origin.x - fontsize.width-10, weight.frame.origin.y , fontsize.width, fontsize.height);
    
    lcal.frame = rect;
    lcal.textColor=[UIColor whiteColor];
    [self.view addSubview:lcal];
    
    lg2 = [[UILabel alloc] init];
    font = [UIFont fontWithName:@"HYShiGuangTiW" size:35];
    lg2.font = font;
    lg2.text=@"g";
    fontsize = [lkj.text sizeWithFont:font];
    
    
    
    rect = CGRectMake(weight.frame.origin.x + weight.frame.size.width +10, weight.frame.origin.y , fontsize.width, fontsize.height);
    
    lg2.frame = rect;
    lg2.textColor=[UIColor whiteColor];
    [self.view addSubview:lg2];
    
    
    if(iPhone6)
    {
       NSLayoutConstraint *layout =  self.view.constraints[18];
        layout.constant= 40;
        
        
        fontsize = [lcal.text sizeWithFont:font];
        rect = CGRectMake(weight.frame.origin.x - fontsize.width-10, weight.frame.origin.y +20 , fontsize.width, fontsize.height);
        lcal.frame = rect;
        
        
        fontsize = [lkj.text sizeWithFont:font];
        rect = CGRectMake(weight.frame.origin.x + weight.frame.size.width +10, weight.frame.origin.y+20 , fontsize.width, fontsize.height);
        
        lg2.frame = rect;
        
    }
    
    
    if(iPhone6plus)
    {
        NSLayoutConstraint *layout =  self.view.constraints[22];
        layout.constant= 50;

        
        fontsize = [lcal.text sizeWithFont:font];
        rect = CGRectMake(weight.frame.origin.x - fontsize.width-10, weight.frame.origin.y +30 , fontsize.width, fontsize.height);
        lcal.frame = rect;
        
        
        fontsize = [lkj.text sizeWithFont:font];
        rect = CGRectMake(weight.frame.origin.x + weight.frame.size.width +10, weight.frame.origin.y+30 , fontsize.width, fontsize.height);
        
        lg2.frame = rect;
        
    }
    
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    NSLayoutConstraint *layout =  self.view.constraints[5];
    layout.constant= 27;
    
    
    CGRect frame = weight.frame;
    int offset = frame.origin.y + 50 - (self.view.frame.size.height - 236.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
//    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:0.3f];
    NSLayoutConstraint *layout =  self.view.constraints[5];
    layout.constant= 57;
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
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
    cal.text = [NSString stringWithFormat:@"%d",(int)fcal];
    
}
@end
