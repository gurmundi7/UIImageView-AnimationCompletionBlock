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


UIImageView-AnimationCompletionBlock
====================================

Completion block for UIImageView animation

This control let you know Animation completion with CompletionBlock;

To use this control just add UIImageView+AnimationCompletion.h & UIImageView+AnimationCompletion.m files to your project and 
import UIImageView+AnimationCompletion.h file in your class.

And use normal animation code that you use for UIImageview animation and at the end use -(void)startAnimatingWithCompletionBlock:(Block)block;

instead of -(void)startAnimating;

For Eg.


        NSMutableArray *imagesArray = [[NSMutableArray alloc] init];
        for(int i = 10001 ; i<= 10010 ; i++)
            [imagesArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]]];
        
        self.animatedImageView.animationImages = imagesArray;
        self.animatedImageView.animationDuration = 2.0f;
        self.animatedImageView.animationRepeatCount = 3;
        [self.animatedImageView startAnimatingWithCompletionBlock:^(BOOL success){
         NSLog(@"Animation Completed",);
     }];


