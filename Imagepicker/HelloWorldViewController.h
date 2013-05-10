//
//  HelloWorldViewController.h
//  Imagepicker
//
//  Created by Karthik on 10/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWorldViewController : UIViewController<UINavigationBarDelegate,UIImagePickerControllerDelegate>{
    UIImagePickerController *ImagePicker;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageview;
- (IBAction)Takephoto:(id)sender;
- (IBAction)Savetogallery:(id)sender;

@end
