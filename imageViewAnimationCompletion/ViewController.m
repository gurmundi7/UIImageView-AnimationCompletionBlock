//
//  ViewController.m
//  imageViewAnimationCompletion
//
//  Created by Gurpreet Singh on 22/01/14.
//  Copyright (c) 2014 Gurpreet Singh. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+AnimationCompletion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    @autoreleasepool {
        // Do any additional setup after loading the view from its nib.
        NSMutableArray *imagesArray = [[NSMutableArray alloc] init];
        for(int i = 10001 ; i<= 10010 ; i++)
            [imagesArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]]];
        
        self.animatedImageView.animationImages = imagesArray;
        self.animatedImageView.animationDuration = 2.0f;
        self.animatedImageView.animationRepeatCount = 3;
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)StartAnimation:(id)sender {
    [(UIButton*)sender setEnabled:NO];
    [self.animatedImageView startAnimatingWithCompletionBlock:^(BOOL success){
         NSLog(@"End %@",[NSNumber numberWithBool:success]);
         [(UIButton*)sender setEnabled:YES];
         [(UIButton*)sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [(UIButton*)sender setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
     }];
}
@end
