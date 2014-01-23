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
    NSLog(@"animationDidStop");
}
@end
