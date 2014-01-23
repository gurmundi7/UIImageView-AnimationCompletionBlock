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
