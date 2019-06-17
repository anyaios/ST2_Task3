//
//  MainTableViewController.h
//  ImagesLoading
//
//  Created by Anna Ershova on 6/16/19.
//  Copyright © 2019 Anna Ershova. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MainTableViewController : UITableViewController
@property (strong, nonatomic) UIImage *imageToSend;
@property (strong, nonatomic) NSMutableArray *sentImages;
@end


