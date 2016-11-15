//
//  DetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Jenny Nguyen on 2016-11-14.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupPanningAndZoomingImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma - Zooming and Panning

-(void)setupPanningAndZoomingImage {
    self.imageView.image = self.image;
    [self.detailScrollView addSubview:self.imageView];
    
    self.detailScrollView.contentSize = self.imageView.bounds.size;
    
    self.detailScrollView.minimumZoomScale = 0.5;
    self.detailScrollView.maximumZoomScale = 100.0;
    self.detailScrollView.delegate = self;
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

//- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
//    
//}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView
withView:(UIView *)view
atScale:(CGFloat)scale {
    
}


@end
