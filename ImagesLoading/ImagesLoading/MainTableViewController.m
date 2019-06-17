//
//  MainTableViewController.m
//  ImagesLoading
//
//  Created by Anna Ershova on 6/16/19.
//  Copyright © 2019 Anna Ershova. All rights reserved.
//

#import "MainTableViewController.h"
#import "DetailsViewController.h"


@interface MainTableViewController () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSArray<NSURL*> *imagesURLArray;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imagesURLArray = @[
                        [NSURL URLWithString:@"https://media.mnn.com/assets/images/2019/01/grumpy_cat.jpg.653x0_q80_crop-smart.jpg"],
                        [NSURL URLWithString:@"https://scontent-frx5-1.cdninstagram.com/vp/efd59409b2bac83c1ad378fe542f39f0/5D80F33E/t51.2885-15/e35/51209147_350241069161826_7334232745829333021_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com"],
                        [NSURL URLWithString: @"https://pbs.twimg.com/profile_images/378800000198640344/ba708dc064f537216aad5dc6717cf1bd.png"],
                        [NSURL URLWithString: @"https://www.wweek.com/resizer/_DDVSRW-9D8QxpWF7m1epefQi-U=/1200x0/filters:quality(100)/s3.amazonaws.com/arc-wordpress-client-uploads/wweek/wp-content/uploads/2018/02/05191110/cats_web.jpg"],
                        [NSURL URLWithString:@"https://vignette.wikia.nocookie.net/disney/images/e/e3/Profile_-_Dipper_Pines.png/revision/latest?cb=20190318192148"],
                        [NSURL URLWithString:@"https://resizing.flixster.com/4EPyfvw507unm0L8c8-jTom7H_0=/300x300/v1.bjsyMDA3ODEyO2o7MTgxMTM7MTIwMDsxMzY2Ozc2OA"]
                        
                        ];
    _sentImages = [NSMutableArray array];
    for (NSURL *urls in _imagesURLArray) {
        NSData *dataSet = [NSData dataWithContentsOfURL: urls];
        _imageToSend = [UIImage imageWithData:dataSet];
        [_sentImages addObject: _imageToSend];
    }
    NSLog(@"%@ images arr ", _sentImages);
    
}
-(void)loadView {
    [super loadView];
    self.title = @"Images";
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _imagesURLArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *mainId = @"MainCellid";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:mainId];
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:mainId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mainId];
    }
    
   _url = _imagesURLArray[indexPath.row];
    NSLog(@"%@  test", _url);
    NSData *data = [NSData dataWithContentsOfURL: _url];
    _image = [UIImage imageWithData:data];
    _imageURL = [_url absoluteString];
    
    NSArray *finalSetImages = [NSArray array];
    finalSetImages = _sentImages;
    
    cell.textLabel.text = _imageURL;
    cell.textLabel.numberOfLines = 0;
    cell.imageView.image = [self sizeForImage:_image changeToSize:CGSizeMake(150,150)];
    
    [cell.imageView setFrame:CGRectMake(0, 0, 100, 100)];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
    [cell.imageView setUserInteractionEnabled: YES];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnImage:)];
    [tap setDelegate: self];
    [cell.imageView addGestureRecognizer:tap];
    cell.imageView.tag = indexPath.row;
    return cell;
 
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (UIImage *)sizeForImage:(UIImage *)image changeToSize:(CGSize)newSize {
    
    
    CGRect imageRect = CGRectZero;
    CGFloat imageWidth = newSize.width / image.size.width;
    CGFloat imageHeight = newSize.height / image.size.height;
    CGFloat aspectRatio = MIN ( imageWidth, imageHeight );
    
    imageRect.size.width = image.size.width * aspectRatio;
    imageRect.size.height = image.size.height * aspectRatio;
    imageRect.origin.x = (newSize.width - imageRect.size.width) / 2.0f;
    imageRect.origin.y = (newSize.height - imageRect.size.height) / 2.0f;
    
    UIGraphicsBeginImageContextWithOptions( newSize, NO, 0 );
    [image drawInRect:imageRect];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

#pragma mark - Delegate

- (void)clickOnImage:(UITapGestureRecognizer*)recognizer {
   
    DetailsViewController *detailsVC = [DetailsViewController new];
    NSArray *newArr = [NSArray array];
    newArr = _sentImages;
    UIView *view = recognizer.view;
    NSLog(@"%ld recognizer tag", (long)view.tag);
    detailsVC.detailsImage = newArr[view.tag];
    NSLog(@"%@ image to sent....", detailsVC.detailsImage);
    [self.navigationController pushViewController:detailsVC animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
