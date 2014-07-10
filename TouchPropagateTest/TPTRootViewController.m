//
//  TPTRootViewController.m
//  TouchPropagateTest
//
//  Created by Phil Dougherty on 7/10/14.
//  Copyright (c) 2014 UWMLI. All rights reserved.
//

#import "TPTRootViewController.h"

@interface TPTRootViewController ()
{
    UIView *enabled_alone;
    UIView *disabled_alone; 
    
    UIView *enabled_parent_with_enabled_child;
    UIView *enabled_child_with_enabled_parent; 
    
    UIView *enabled_parent_with_disabled_child;
    UIView *disabled_child_with_enabled_parent;  
    
    UIView *disabled_parent_with_enabled_child;
    UIView *enabled_child_with_disabled_parent;  
    
    UIView *disabled_parent_with_disabled_child;
    UIView *disabled_child_with_disabled_parent;   
}

@end

@implementation TPTRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) loadView
{
    [super loadView];
    self.view.userInteractionEnabled = YES;
    
    int parent_size = 100;
    int child_size = 60;
    int padding = 10;
    int currentHeight = 20;
    
    CGRect parentRect = CGRectMake(0,0,parent_size,parent_size);
    CGRect childRect = CGRectMake((parent_size-child_size)/2,(parent_size-child_size)/2,child_size,child_size); 
    CGRect tempRect;
    
    currentHeight += padding;
    
    tempRect = parentRect;
    tempRect.origin.x = padding;
    tempRect.origin.y = currentHeight; 
    enabled_alone = [[UIView alloc] initWithFrame:tempRect];
    enabled_alone.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f];
    enabled_alone.userInteractionEnabled = YES;
    [enabled_alone addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enabled_alone_tapped)]];
    [self.view addSubview:enabled_alone];
    
    tempRect = parentRect;
    tempRect.origin.x = self.view.bounds.size.width-parent_size-padding;
    tempRect.origin.y = currentHeight; 
    disabled_alone = [[UIView alloc] initWithFrame:tempRect];
    disabled_alone.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f];
    disabled_alone.userInteractionEnabled = NO;
    [disabled_alone addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disabled_alone_tapped)]]; 
    [self.view addSubview:disabled_alone]; 
    
    currentHeight += parent_size + padding; 
    
    tempRect = parentRect;
    tempRect.origin.x = padding;
    tempRect.origin.y = currentHeight;  
    enabled_parent_with_enabled_child = [[UIView alloc] initWithFrame:tempRect];
    enabled_parent_with_enabled_child.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f];
    enabled_parent_with_enabled_child.userInteractionEnabled = YES; 
    [enabled_parent_with_enabled_child addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enabled_parent_with_enabled_child_tapped)]];
    enabled_child_with_enabled_parent = [[UIView alloc] initWithFrame:childRect]; 
    enabled_child_with_enabled_parent.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0f];
    enabled_child_with_enabled_parent.userInteractionEnabled = YES; 
    [enabled_child_with_enabled_parent addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enabled_child_with_enabled_parent_tapped)]];
    [enabled_parent_with_enabled_child addSubview:enabled_child_with_enabled_parent];
    [self.view addSubview:enabled_parent_with_enabled_child]; 
    
    tempRect = parentRect;
    tempRect.origin.x = self.view.bounds.size.width-parent_size-padding; 
    tempRect.origin.y = currentHeight;  
    enabled_parent_with_disabled_child = [[UIView alloc] initWithFrame:tempRect];
    enabled_parent_with_disabled_child.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f];
    enabled_parent_with_disabled_child.userInteractionEnabled = YES; 
    [enabled_parent_with_disabled_child addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enabled_parent_with_disabled_child_tapped)]]; 
    disabled_child_with_enabled_parent = [[UIView alloc] initWithFrame:childRect]; 
    disabled_child_with_enabled_parent.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0f];
    disabled_child_with_enabled_parent.userInteractionEnabled = NO; 
    [disabled_child_with_enabled_parent addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disabled_child_with_enabled_parent_tapped)]]; 
    [enabled_parent_with_disabled_child addSubview:disabled_child_with_enabled_parent];
    [self.view addSubview:enabled_parent_with_disabled_child];  
    
    currentHeight += parent_size + padding;  
    
    tempRect = parentRect;
    tempRect.origin.x = padding;
    tempRect.origin.y = currentHeight;;  
    disabled_parent_with_enabled_child = [[UIView alloc] initWithFrame:tempRect];
    disabled_parent_with_enabled_child.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f];
    disabled_parent_with_enabled_child.userInteractionEnabled = NO; 
    [disabled_parent_with_enabled_child addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disabled_parent_with_enabled_child_tapped)]]; 
    enabled_child_with_disabled_parent = [[UIView alloc] initWithFrame:childRect]; 
    enabled_child_with_disabled_parent.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0f];
    enabled_child_with_disabled_parent.userInteractionEnabled = YES; 
    [enabled_child_with_disabled_parent addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enabled_child_with_disabled_parent_tapped)]];  
    [disabled_parent_with_enabled_child addSubview:enabled_child_with_disabled_parent];
    [self.view addSubview:disabled_parent_with_enabled_child];  
    
    tempRect = parentRect;
    tempRect.origin.x = self.view.bounds.size.width-parent_size-padding; 
    tempRect.origin.y = currentHeight;   
    disabled_parent_with_disabled_child = [[UIView alloc] initWithFrame:tempRect];
    disabled_parent_with_disabled_child.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f];
    disabled_parent_with_disabled_child.userInteractionEnabled = NO; 
    [disabled_parent_with_disabled_child addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disabled_parent_with_disabled_child_tapped)]]; 
    disabled_child_with_disabled_parent = [[UIView alloc] initWithFrame:childRect]; 
    disabled_child_with_disabled_parent.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0f];
    disabled_child_with_disabled_parent.userInteractionEnabled = NO; 
    [disabled_child_with_disabled_parent addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disabled_child_with_disabled_parent_tapped)]];  
    [disabled_parent_with_disabled_child addSubview:disabled_child_with_disabled_parent];
    [self.view addSubview:disabled_parent_with_disabled_child];  
}

- (void) enabled_alone_tapped { NSLog(@"enabled_alone_tapped"); }
- (void) disabled_alone_tapped { NSLog(@"disabled_alone_tapped"); }
- (void) enabled_parent_with_enabled_child_tapped { NSLog(@"enabled_parent_with_enabled_child_tapped"); }
- (void) enabled_child_with_enabled_parent_tapped { NSLog(@"enabled_child_with_enabled_parent_tapped"); }
- (void) enabled_parent_with_disabled_child_tapped { NSLog(@"enabled_parent_with_disabled_child_tapped"); }
- (void) disabled_child_with_enabled_parent_tapped { NSLog(@"disabled_child_with_enabled_parent_tapped"); } 
- (void) disabled_parent_with_enabled_child_tapped { NSLog(@"disabled_parent_with_enabled_child_tapped"); }
- (void) enabled_child_with_disabled_parent_tapped { NSLog(@"enabled_child_with_disabled_parent_tapped"); } 
- (void) disabled_parent_with_disabled_child_tapped { NSLog(@"disabled_parent_with_disabled_child_tapped"); }
- (void) disabled_child_with_disabled_parent_tapped { NSLog(@"disabled_child_with_disabled_parent_tapped"); }

@end
