//
//  UIImageView+AnimationCompletion.h
//  imageViewAnimationCompletion
//
//  Created by Gurpreet Singh on 22/01/14.
//  Copyright (c) 2014 Gurpreet Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Block)(BOOL success);
@interface UIImageView (AnimationCompletion)
-(void)startAnimatingWithCompletionBlock:(Block)block;
@end
