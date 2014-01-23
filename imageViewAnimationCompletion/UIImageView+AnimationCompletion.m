/*
 * Copyright (c) 22/01/14 Gurpreet Singh Mundi (@Gurmundi7)
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
//
//  UIImageView+AnimationCompletion.m
//  imageViewAnimationCompletion
//
//  Created by Gurpreet Singh on 22/01/14.
//  Copyright (c) 2014 Gurpreet Singh. All rights reserved.
//

#import "UIImageView+AnimationCompletion.h"
#import <objc/runtime.h>

#define BLOCK_KEY @"BLOCK_KEY"
#define CONTENTS  @"contents"
@implementation UIImageView (AnimationCompletion)
-(void)setblock:(Block)block
{
    objc_setAssociatedObject(self, (__bridge const void *)(BLOCK_KEY), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(Block)block
{
    return objc_getAssociatedObject(self, (__bridge const void *)(BLOCK_KEY));
}
-(void)startAnimatingWithCompletionBlock:(Block)block
{
    [self startAnimatingWithCGImages:getCGImagesArray(self.animationImages) CompletionBlock:block];
}
-(void)startAnimatingWithCGImages:(NSArray*)cgImages CompletionBlock:(Block)block
{
    [self setblock:block];
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    [anim setKeyPath:CONTENTS];
    [anim setValues:cgImages];
    [anim setRepeatCount:self.animationRepeatCount];
    [anim setDuration:self.animationDuration];
    anim.delegate = self;
    
    CALayer *ImageLayer = self.layer;
    [ImageLayer addAnimation:anim forKey:nil];
}
NSArray* getCGImagesArray(NSArray* UIImagesArray)
{
    NSMutableArray* cgImages;
    @autoreleasepool {
        cgImages = [[NSMutableArray alloc] init];
        for (UIImage* image in UIImagesArray)
            [cgImages addObject:(id)image.CGImage];
    }
    return cgImages;
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
   Block block_ = [self block];
    if (block_)block_(flag);
}
@end
