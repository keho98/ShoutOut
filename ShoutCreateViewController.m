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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    
    UIImage *imageOfEvent = [UIImage imageNamed:@"notuploaded.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:imageOfEvent];
    imageView.frame = CGRectMake(50, 50, imageOfEvent.size.width, imageOfEvent.size.height);
    [self.view addSubview:imageView];
    
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, 100, 100)];
    [textField setText:@"Hello World"];
    [self.view addSubview:textField];
}

- (void)viewDidUnload
{
    [self setTextfield:nil];
    [self setDescription:nil];
    [self setDescription:nil];
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
