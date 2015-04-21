//
//  RCPluginBoardItem.h
//  CollectionViewTest
//
//  Created by Liv on 15/3/15.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCPluginBoardItem : UICollectionViewCell

@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) UIImage *image;


-(instancetype)initWithTitle:(NSString *) title
                       image:(UIImage *) image;
@end
