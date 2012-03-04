//
//  ShoutCreateViewController.m
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShoutCreateViewController.h"

@implementation ShoutCreateViewController
@synthesize Textfield;
@synthesize Description;
@synthesize image;
@synthesize camera;

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    NSLog(@"Hello!");
}
- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    NSLog(@"Pinch");
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //image = [[UIImageView init] alloc];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self setTappableView:self.image];
    
}

- (void)viewDidUnload
{
    [self setTextfield:nil];
    [self setDescription:nil];
    [self setDescription:nil];
    [self setImage:nil];
    [self setImage:nil];
    [self setCamera:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
