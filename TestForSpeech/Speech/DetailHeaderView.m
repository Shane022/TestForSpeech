//
//  DetailHeaderView.m
//  TestForSpeech
//
//  Created by Shane on 2019/7/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "DetailHeaderView.h"
#import "CSStickyHeaderFlowLayoutAttributes.h"

@implementation DetailHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.summaryView.backgroundColor = [UIColor clearColor];
}

- (void)applyLayoutAttributes:(CSStickyHeaderFlowLayoutAttributes *)layoutAttributes {
}

@end
