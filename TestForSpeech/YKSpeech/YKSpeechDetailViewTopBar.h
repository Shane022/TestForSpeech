//
//  YKSpeechDetailViewTopBar.h
//  TestForSpeech
//
//  Created by Shane on 2019/7/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YKSpeechDetailViewTopBarDelegate <NSObject>

- (void)didSelectBackButton:(UIButton *)button;
- (void)didSelectShareButton:(UIButton *)shareButton;

@end

@interface YKSpeechDetailViewTopBar : UIView

@property (nonatomic, weak) id<YKSpeechDetailViewTopBarDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
