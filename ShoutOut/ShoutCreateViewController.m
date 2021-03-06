//
//  ShoutCreateViewController.m
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShoutCreateViewController.h"

@implementation ShoutCreateViewController
@synthesize textfield, description, imageIcon;
@synthesize camera;


- (IBAction)end:(id)sender {
    //Empty?
}

/* UIImagePickerControllerDelegate Functions */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [[picker presentingViewController] dismissModalViewControllerAnimated:YES];
    [(UIImageView*)[self.view viewWithTag:8] setContentMode: UIViewContentModeScaleAspectFit];
    newImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //NSData *imageData = UIImageJPEGRepresentation(newImage, 1.0);
    //NSString *imageDataEncoded = [Base64 base64StringFromData:imageData length:[imageData length]];
    //NSString *encodedString = [NSData+Base64 initWithBase64EncodedString:imageData];
    
    [(UIImageView*)[self.view viewWithTag:8] setImage:newImage];
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
    
    //[self imagePickerController:nil didFinishPickingMediaWithInfo:nil];
    cameraUI.delegate = delegate;
    
    [controller presentModalViewController: cameraUI animated: YES];
    return YES;
}



- (IBAction)tap:(UITapGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateBegan){
        [(UIImageView*)[self.view viewWithTag:8] setBackgroundColor:[UIColor greenColor]];
        [(UIImageView*)[self.view viewWithTag:8] setNeedsDisplay];
    }
    else if(sender.state == UIGestureRecognizerStateEnded){
        [(UIImageView*)[self.view viewWithTag:8] setBackgroundColor:[UIColor whiteColor]];
        //[(UIImageView*)[self.view viewWithTag:8] setNeedsDisplay];
        [self startCameraControllerFromViewController: self usingDelegate: self];
    }
}

//Submit command
//Should reset text fields and photo
- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    int user_id = 6;
    float latitude = 5.32987;
    float longitude = 6.6659;
    NSString *url = [NSString stringWithFormat:@"http://shoutoutbackend.herokuapp.com/closestEvents/?user_id=%@&latitude=%@&=longitude=%@&", [NSString stringWithFormat:@"%i",user_id],[NSString stringWithFormat:@"%f",latitude], [NSString stringWithFormat:@"%f",longitude], textfield.text, description.text];
    [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [(UITabBarController*) self.parentViewController setSelectedIndex:0];
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
    
}

- (void)viewDidUnload
{
    [self setTextfield:nil];
    [self setDescription:nil];
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
