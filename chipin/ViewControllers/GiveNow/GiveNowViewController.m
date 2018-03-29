//
//  GiveNowViewController.m
//  chipin
//
//  Created by Eric Mcallister on 26/01/2018.
//  Copyright © 2018 wttech. All rights reserved.
//

#import "GiveNowViewController.h"

@interface GiveNowViewController ()

@end

@implementation GiveNowViewController
bool trufal = YES;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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



- (NSInteger)numberOfSectionsInTableView:(UITableView *) tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.0f;
    //set height according to row or section , whatever you want to do!
}

//- (UIView *)tableView:(UITableView *) tableView viewForFooterInSection:(NSInteger)section{
//
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if(trufal){
        cell = [tableView dequeueReusableCellWithIdentifier:@"coin-right"];
        trufal = NO;
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"coin-left"];
        trufal = YES;
    }
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    
}

@end
