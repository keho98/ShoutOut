//
//  ShoutCreateViewController.h
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoutCreateViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *Textfield;
@property (weak, nonatomic) IBOutlet UITextField *Description;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIImageView *camera;



@end
