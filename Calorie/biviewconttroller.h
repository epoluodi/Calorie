//
//  biviewconttroller.h
//  Calorie
//
//  Created by Stereo on 16/1/4.
//  Copyright © 2016年 com.epoluodi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Common/PublicCommon.h>

@interface biviewconttroller : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table1;
    UITableView *table2;
}
@end
