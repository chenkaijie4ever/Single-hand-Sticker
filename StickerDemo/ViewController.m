//
//  ViewController.m
//  StickerDemo
//
//  Created by CKJ on 16/1/29.
//  Copyright © 2016年 CKJ. All rights reserved.
//

#import "ViewController.h"

#import "StickerView.h"

@interface ViewController () <StickerViewDelegate>

@property (strong, nonatomic) StickerView *selectedSticker;

@property (strong,nonatomic) UIDynamicAnimator * animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initial];
}

- (void)initial {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackground:)];
    [tapRecognizer setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapRecognizer];
    
    StickerView *sticker1 = [[StickerView alloc] initWithContentFrame:CGRectMake(0, 0, 150, 150) contentImage:[UIImage imageNamed:@"sticker1.png"]];
    sticker1.center = self.view.center;
    sticker1.enabledControl = NO;
    sticker1.enabledBorder = NO;
    sticker1.delegate = self;
    sticker1.tag = 1;
    [self.view addSubview:sticker1];
    
    StickerView *sticker2 = [[StickerView alloc] initWithContentFrame:CGRectMake(0, 0, 150, 150) contentImage:[UIImage imageNamed:@"sticker2.png"]];
    sticker2.center = self.view.center;
    sticker2.enabledControl = NO;
    sticker2.enabledBorder = NO;
    sticker2.delegate = self;
    sticker2.tag = 2;
    [self.view addSubview:sticker2];
    
    StickerView *sticker3 = [[StickerView alloc] initWithContentFrame:CGRectMake(0, 0, 150, 150) contentImage:[UIImage imageNamed:@"sticker3.png"]];
    sticker3.center = self.view.center;
    sticker3.enabledControl = NO;
    sticker3.enabledBorder = NO;
    sticker3.delegate = self;
    sticker3.tag = 3;
    [self.view addSubview:sticker3];
    
    [sticker1 performTapOperation];
}

- (void)tapBackground:(UITapGestureRecognizer *)recognizer {
    if (self.selectedSticker) {
        self.selectedSticker.enabledControl = NO;
        self.selectedSticker.enabledBorder = NO;
        self.selectedSticker = nil;
    }
}

#pragma mark - StickerViewDelegate

- (UIImage *)stickerView:(StickerView *)stickerView imageForRightTopControl:(CGSize)recommendedSize {
    return [UIImage imageNamed:@"StickerView.bundle/btn_smile.png"];
}

- (UIImage *)stickerView:(StickerView *)stickerView imageForLeftBottomControl:(CGSize)recommendedSize {
    return [UIImage imageNamed:@"StickerView.bundle/btn_flip.png"];
}

- (void)stickerViewDidTapContentView:(StickerView *)stickerView {
    NSLog(@"Tap[%zd] ContentView", stickerView.tag);
    if (self.selectedSticker) {
        self.selectedSticker.enabledBorder = NO;
        self.selectedSticker.enabledControl = NO;
    }
    self.selectedSticker = stickerView;
    self.selectedSticker.enabledBorder = YES;
    self.selectedSticker.enabledControl = YES;
}

- (void)stickerViewDidTapDeleteControl:(StickerView *)stickerView {
    NSLog(@"Tap[%zd] DeleteControl", stickerView.tag);
    for (UIView *subView in self.view.subviews) {
        if ([subView isKindOfClass:[StickerView class]]) {
            [(StickerView *)subView performTapOperation];
            break;
        }
    }
}

- (void)stickerViewDidTapLeftBottomControl:(StickerView *)stickerView {
    NSLog(@"Tap[%zd] LeftBottomControl", stickerView.tag);
    UIImageOrientation targetOrientation = (stickerView.contentImage.imageOrientation == UIImageOrientationUp ? UIImageOrientationUpMirrored : UIImageOrientationUp);
    UIImage *invertImage =[UIImage imageWithCGImage:stickerView.contentImage.CGImage
                                              scale:1.0
                                        orientation:targetOrientation];
    stickerView.contentImage = invertImage;
}

- (void)stickerViewDidTapRightTopControl:(StickerView *)stickerView {
    NSLog(@"Tap[%zd] RightTopControl", stickerView.tag);
    [_animator removeAllBehaviors];
    UISnapBehavior * snapbehavior = [[UISnapBehavior alloc] initWithItem:stickerView snapToPoint:self.view.center];
    snapbehavior.damping = 0.65;
    [self.animator addBehavior:snapbehavior];
}

@end
