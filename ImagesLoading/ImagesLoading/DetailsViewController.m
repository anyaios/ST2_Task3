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
@property (strong, nonatomic) UIImageView *detailsView;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _detailsView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    if (_detailsImage.size.width > self.view.bounds.size.width || _detailsImage.size.height > self.view.bounds.size.height) {
    //CGFloat imageRatio = _detailsImage.size.height / _detailsImage.size.width;
        _detailsView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _detailsView.image = _detailsImage;
       
    }
    else {
        _detailsView.image = _detailsImage;
    }
     _detailsView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_detailsView];
    
   
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
