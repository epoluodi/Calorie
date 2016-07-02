//
//  biviewconttroller.h
//  Calorie
//
//  Created by Stereo on 16/1/4.
//  Copyright © 2016年 com.epoluodi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Common/PublicCommon.h>
#import <HealthKit/HealthKit.h>


@interface biviewconttroller : UIViewController
{
    HKHealthStore *healthstore;
}

@property (weak, nonatomic) IBOutlet UILabel *stepcount;

- (IBAction)clickreturn:(id)sender;

@end
