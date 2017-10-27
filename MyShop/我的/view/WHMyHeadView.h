//
//  WHMyHeadView.h
//  MyShop
//
//  Created by 王辉 on 2017/10/26.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RegisterButtonBlock)();
@interface WHMyHeadView : UIView

/** 注册点击block **/
@property(nonatomic,copy) RegisterButtonBlock registerBlock;

@end
