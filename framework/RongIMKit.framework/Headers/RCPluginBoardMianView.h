//
//  RCPluginBoardMianView.h
//  RongIMKit
//
//  Created by 杜立召 on 15/3/16.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  RCEmojiPageControl;
@interface RCPluginBoardMianView : UIView<UIScrollViewDelegate>
{
    RCEmojiPageControl* pageCtrl;
    
}
@property (nonatomic, assign) int totalItems;
@property (nonatomic, assign) int totalPage;
@property(nonatomic, strong) UIScrollView* pageBgView;
@end
