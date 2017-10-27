//
//  WHRegisterInputView.h
//  MyShop
//
//  Created by 王辉 on 2017/10/27.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^nextViewControllerBlock)(NSDictionary *dict);
@interface WHRegisterInputView : UIView

/** 去往下一个控制器的回调block **/
@property(nonatomic,copy) nextViewControllerBlock nextBlock;

@end
