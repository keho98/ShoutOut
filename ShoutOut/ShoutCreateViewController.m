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
@synthesize imageIcon;
@synthesize camera;


- (IBAction)end:(id)sender {
    //Empty?
}

/* UIImagePickerControllerDelegate Functions */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage * newImage =[info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imageIcon setImage:newImage];
    //self.imageIcon.image = newImage; DOES NOT WORK
    [[picker presentingViewController] dismissModalViewControllerAnimated:YES];
}

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    
    [[picker presentingViewController] dismissModalViewControllerAnimated: YES];
}

- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate>) delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = NO;
    
    cameraUI.delegate = delegate;
    
    [controller presentModalViewController: cameraUI animated: YES];
    return YES;
}

/* end UIImagePickerControllerDelegate Functions */


- (IBAction)tap:(UITapGestureRecognizer *)sender {
    [self startCameraControllerFromViewController: self usingDelegate: self];
    
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
    [self setImageIcon:nil];
    [self setImageIcon:nil];
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
