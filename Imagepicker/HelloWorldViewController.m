//
//  HelloWorldViewController.m
//  Imagepicker
//
//  Created by Karthik on 10/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController
@synthesize imageview;

- (IBAction)Takephoto:(id)sender{
    imageview.image=nil;
    
    [self startCameraControllerFromViewController: self usingDelegate: self];    
}

- (void) imagePickerController: (UIImagePickerController *) picker

 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    UIImage *image;
    image=(UIImage *)[info valueForKey:UIImagePickerControllerOriginalImage];
    imageview.image=image;
    [picker dismissModalViewControllerAnimated:YES];
    
    
}
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    
    
    
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    
    // [picker release];
    
}

- (IBAction)Savetogallery:(id)sender{
    UIImage *imageSave;
    imageSave=imageview.image;
    UIImageWriteToSavedPhotosAlbum(imageSave, nil, nil, nil);
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Saved"
                          message: @"Image Saved Successfully"
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}
- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller

                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   
                                                   UINavigationControllerDelegate>) delegate {
    
    
    
    if (([UIImagePickerController isSourceTypeAvailable:
          
          UIImagePickerControllerSourceTypeCamera] == NO)
        
        || (delegate == nil)
        
        || (controller == nil))
        
        return NO;
    
    
    
    
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    
    
    // Displays a control that allows the user to choose picture or
    
    // movie capture, if both are available:
    
    cameraUI.mediaTypes =
    
    [UIImagePickerController availableMediaTypesForSourceType:
     
     UIImagePickerControllerSourceTypeCamera];
    
    
    
    // Hides the controls for moving & scaling pictures, or for
    
    // trimming movies. To instead show the controls, use YES.
    
    cameraUI.allowsEditing = NO;
    
    
    
    cameraUI.delegate = delegate;
    
    
    
    [controller presentModalViewController: cameraUI animated: YES];
    
    return YES;
    
}



- (void)viewDidLoad
{
    
    ImagePicker=[[UIImagePickerController alloc]init];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
