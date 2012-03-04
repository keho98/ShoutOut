//
//  ShoutCreateViewController.h
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoutCreateViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>{
    UIImage *newImage;
}
@property (strong, nonatomic) IBOutlet UITextField *textfield;
@property (strong, nonatomic) IBOutlet UITextField *description;
@property (strong, nonatomic) IBOutlet UIImageView *imageIcon;
@property (strong, nonatomic) IBOutlet UIImageView *camera;

@end
