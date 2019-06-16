//
//  MainTableViewController.m
//  ImagesLoading
//
//  Created by Anna Ershova on 6/16/19.
//  Copyright © 2019 Anna Ershova. All rights reserved.
//

#import "MainTableViewController.h"
#import "DetailsViewController.h"


@interface MainTableViewController ()
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *imageURL;
@property (strong,nonatomic) NSURL *url;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}
-(void)loadView {
    [super loadView];
    self.title = @"Images";
    _url= [NSURL URLWithString:@"https://media.mnn.com/assets/images/2019/01/grumpy_cat.jpg.653x0_q80_crop-smart.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:_url];
    _image = [UIImage imageWithData:data];
    
    
    _imageURL = @"sjdhfksjdhflkshlkjshglkhdflgkhdflkghnx.dkbnxc,b";
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 60;
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
    
    cell.textLabel.text = _imageURL;
    cell.textLabel.numberOfLines = 0;
    cell.imageView.image = [self sizeForImage:_image changeToSize:CGSizeMake(100,100)];
   
    [cell.imageView setFrame:CGRectMake(0, 0, 100, 100)];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
    [cell.imageView setUserInteractionEnabled: YES];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnImage)];
    [cell.imageView addGestureRecognizer:tap];
    
    return cell;
 
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

-(void)clickOnImage{
    DetailsViewController *detailsVC = [DetailsViewController new];
    detailsVC.detailsImage = _image;
    [self.navigationController pushViewController:detailsVC animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
