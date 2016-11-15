//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Jenny Nguyen on 2016-11-14.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIImageView *iPhoneImagesView;
@property (strong, nonatomic, readonly) NSArray<UIImage *> *images;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImage *lighthouseImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat imageXPosition = 0;
    
    CGFloat scrollViewWidth = CGRectGetWidth(self.view.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(self.scrollView.frame);
    
    for (UIImage *lighthouseImage in self.images) {
        UIImageView *iPhoneImagesView = [[UIImageView alloc]initWithImage:lighthouseImage];
        
        iPhoneImagesView.frame = CGRectMake(imageXPosition, 0, scrollViewWidth, scrollViewHeight);
        iPhoneImagesView.contentMode = UIViewContentModeScaleAspectFit;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureTapped:)];
        [iPhoneImagesView addGestureRecognizer:tapGesture];
        iPhoneImagesView.userInteractionEnabled = YES;
        
        [self.scrollView addSubview:iPhoneImagesView];
        imageXPosition += scrollViewWidth;

    }
    self.scrollView.contentSize = CGSizeMake(scrollViewWidth*self.images.count, scrollViewHeight);
     self.scrollView.delegate = self;
}

- (void)tapGestureTapped:(UITapGestureRecognizer *)gestureRecognizer {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)setTapGesture:(UITapGestureRecognizer *)sender{
    UIImageView * showImage = (UIImageView *)sender.view;
    //if ([imageView isKindOfClass:[UIImageView class]]) {
        [self performSegueWithIdentifier:@"showDetail" sender:showImage.image];
    //}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *dvc = [segue destinationViewController];
        dvc.detailImage = sender;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {

    CGFloat width = self.scrollView.frame.size.width;
    NSInteger page = (self.scrollView.contentOffset.x + (0.5f * width)) / width;
    self.pageControl.currentPage = page;
    
}

- (NSArray<UIImage *> *) images{
    return @[
             [UIImage imageNamed:@"LighthouseInField"],
             [UIImage imageNamed:@"LighthouseNightImage"],
             [UIImage imageNamed:@"LighthouseZoomed"],
             ];
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}


@end
