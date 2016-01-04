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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self inittable];
    
}


-(void)inittable
{
    table1 = [[UITableView alloc] init];
    table2 = [[UITableView alloc] init];
    table1.tag=0;
    table2.tag=1;
    
    CGRect rect;
    rect= CGRectMake(0, 110, [PublicCommon GetALLScreen].size.width/2, [PublicCommon GetALLScreen].size.height - 110);
    table1.frame= rect;
    rect= CGRectMake([PublicCommon GetALLScreen].size.width/2, 110, [PublicCommon GetALLScreen].size.width/2, [PublicCommon GetALLScreen].size.height - 110);
    table2.frame=rect;
    [self.view addSubview:table1];
    [self.view addSubview:table2];
    
    

    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
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

@end
