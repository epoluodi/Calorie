//
//  biviewconttroller.m
//  Calorie
//
//  Created by Stereo on 16/1/4.
//  Copyright © 2016年 com.epoluodi. All rights reserved.
//

#import "biviewconttroller.h"


@interface biviewconttroller ()

@end

@implementation biviewconttroller
@synthesize stepcount;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //查看healthKit在设备上是否可用，ipad不支持HealthKit
    if(![HKHealthStore isHealthDataAvailable])
    {
        NSLog(@"设备不支持healthKit");
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"提示" message:@"设备不支持健康信息" delegate:nil cancelButtonTitle:@"" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    //创建healthStore实例对象
    healthstore = [[HKHealthStore alloc] init];
    
    //设置需要获取的权限这里仅设置了步数
    HKObjectType *stepCount = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    
    NSSet *healthSet = [NSSet setWithObjects:stepCount, nil];
    
    //从健康应用中获取权限
    [healthstore requestAuthorizationToShareTypes:nil readTypes:healthSet completion:^(BOOL success, NSError * _Nullable error) {
        if (success)
        {
            NSLog(@"获取步数权限成功");
            //获取步数后我们调用获取步数的方法
            [self readStepCount];
        }
        else
        {
            NSLog(@"获取步数权限失败");
        }
    }];
}

//查询数据
- (void)readStepCount
{
    //查询采样信息
    HKSampleType *sampleType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    
    //NSSortDescriptors用来告诉healthStore怎么样将结果排序。
    NSSortDescriptor *start = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
    NSSortDescriptor *end = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    
    /*查询的基类是HKQuery，这是一个抽象类，能够实现每一种查询目标，这里我们需要查询的步数是一个
     HKSample类所以对应的查询类就是HKSampleQuery。
     下面的limit参数传1表示查询最近一条数据,查询多条数据只要设置limit的参数值就可以了
     */
    
    
    
    HKSampleQuery *sampleQuery = [[HKSampleQuery alloc] initWithSampleType:sampleType predicate:nil limit:1 sortDescriptors:@[start,end] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        //打印查询结果
        NSLog(@"resultCount = %ld result = %@",results.count,results);
        //把结果装换成字符串类型
        HKQuantitySample *result = results[0];
        HKQuantity *quantity = result.quantity;
        NSString *stepStr = (NSString *)quantity;
        sleep(1);
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
//            //查询是在多线程中进行的，如果要对UI进行刷新，要回到主线程中
            
            CATransition *transition = [CATransition animation];
           
            transition.duration = 0.4f;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            transition.type = kCATransitionPush;
            transition.subtype = kCATransitionFromTop;
            stepcount.text =[NSString stringWithFormat:@"%@ 步",[quantity valueForKey:@"_value"]];
            [stepcount.layer addAnimation:transition forKey:@"animation"];
            
            
           
     
            
            NSLog(@"最新步数：%@",stepStr);
        }];
        
    }];
    //执行查询
    [healthstore executeQuery:sampleQuery];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickreturn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
