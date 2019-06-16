//
//  DetailsViewController.m
//  ImagesLoading
//
//  Created by Anna Ershova on 6/17/19.
//  Copyright © 2019 Anna Ershova. All rights reserved.
//

#import "DetailsViewController.h"
#import "MainTableViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *detailsView = [[UIImageView alloc] initWithImage:_detailsImage];
    [self.view addSubview:detailsView];
   
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
