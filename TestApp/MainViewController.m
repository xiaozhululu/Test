//
//  MainViewController.m
//  TestApp
//
//  Created by NSF on 15/2/28.
//  Copyright (c) 2015年 NSF. All rights reserved.
//

#import "MainViewController.h"
#import "CustomNavigationController.h"
#import "HomeViewController.h"
#import "AddressBookViewController.h"
#import "FindViewController.h"
#import "MyselfViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewControllers = @[
                             [self createViewControllersWithControllerClass:[HomeViewController class] title:@"Home" imageName:[UIImage imageNamed:@"home"] selectedImageName:[UIImage imageNamed:@"home_selected"]],
                             [self createViewControllersWithControllerClass:[AddressBookViewController class] title:@"AddressBook" imageName:[UIImage imageNamed:@"myself"] selectedImageName:[UIImage imageNamed:@"myself_selected"]],
                             [self createViewControllersWithControllerClass:[FindViewController class] title:@"Find" imageName:[UIImage imageNamed:@"home"] selectedImageName:[UIImage imageNamed:@"home_selected"]],
                             [self createViewControllersWithControllerClass:[MyselfViewController class] title:@"Myself" imageName:[UIImage imageNamed:@"myself"] selectedImageName:[UIImage imageNamed:@"myself_selected"]],
                             ];
    // Do any additional setup after loading the view.
}

- (id)createViewControllersWithControllerClass:(Class)class title:(NSString *)title imageName:(UIImage *)image selectedImageName:(UIImage *)selectedImage
{
    Class cls = class;
    UIViewController *viewController = [[cls alloc] init];
    viewController.title = title;
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0);
    
    CustomNavigationController *navController = [[CustomNavigationController alloc] initWithRootViewController:viewController];
    
    return navController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
