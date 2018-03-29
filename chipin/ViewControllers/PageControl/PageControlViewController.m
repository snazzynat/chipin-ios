//
//  PageControlViewController.m
//  chipin
//
//  Created by Eric Mcallister on 26/01/2018.
//  Copyright © 2018 wttech. All rights reserved.
//

#import "PageControlViewController.h"
#import "PageController.h"

@interface PageControlViewController () <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

@implementation PageControlViewController

NSArray *pageTitles;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //    UIButton *barButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    ////    barButton.title = @"Custom Title";
    //    barButton.backgroundColor = [UIColor clearColor];
    //    [barButton setImage:[UIImage imageNamed:@"ic_menu_white"] forState:UIControlStateNormal];
    //    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
    
    pageTitles = [NSArray arrayWithObjects:@"Playful", @"Goal-Oriented", @"Reflective", nil];
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageViews"];
    self.pageViewController.dataSource = self;
    
    UIViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageController *) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == 3) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (PageController *)viewControllerAtIndex:(NSUInteger)index
{
    NSString *str = @"";
    
    switch(index) {
        case 0:
            str = @"newsFeed";
            break;
        case 1:
            str = @"giveNow";
            break;
        case 2:
            str = @"subscribe";
            break;
        default:
            break;
    }
    NSLog(str);
    // Create a new view controller and pass suitable data.
    PageController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:str];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

@end
