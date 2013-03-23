//
//  MCImagePickerViewController.m
//  MemCards
//
//  Created by bogash on 30.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCImagePickerViewController.h"
#import "MCGameField.h"
#import "MCCard.h"
#include <QuartzCore/QuartzCore.h>

#import "MCMainViewController.h"
int count = 0;
@interface MCImagePickerViewController ()

@end


@implementation MCImagePickerViewController

@synthesize imageView, photoLibrary, standardIcons, mainViev, mscrollview;
@synthesize popover;
-(IBAction) getStandartIcons:(id) sender{

    [mscrollview setHidden:NO];
    [mainViev setHidden:NO];
    
    if(count == 0){
        count++ ;
    
for(int icon_count=1;icon_count<9;icon_count++){
        NSString *img_name  = [[NSString alloc] initWithFormat:@"icon%d", icon_count];            
        UIImage *icon_image = [UIImage imageNamed:img_name];
        UIButton * icon = [UIButton buttonWithType:UIButtonTypeCustom];
        [icon setImage:icon_image forState:UIControlStateNormal];
        [icon addTarget:self action:@selector(iconClicked:) forControlEvents:UIControlEventTouchUpInside];
        icon.tag = icon_count;
        if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            icon.frame=CGRectMake(269, 300*(icon_count-1)+60, 200 , 300);
            icon.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        }else{
            icon.frame=CGRectMake(60, 300*(icon_count-1)+60, 200 , 300);
            icon.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        }
        [self.mscrollview  addSubview: icon];
 }
 if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
    // if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
     
        // mscrollview.frame = CGRectMake(0, 0,780 , 1100);
         // code for landscape orientation
   
     mscrollview.frame =mainViev.frame;
    
     // CGRectMake(0, 0,self.view.frame.size.width , self.view.frame.size.height);
     
        // mscrollview.frame = self.view.frame;
         mscrollview.contentSize = CGSizeMake(768,2600);
         // code for Portrait orientation
    
    
 }
      if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)  {
     mscrollview.frame =mainViev.frame;
     mscrollview.contentSize = CGSizeMake(320,2500);

 
 }
    }
/*
}
  // MCMainViewController* picker = [[MCMainViewController alloc] initWith];
     MCMainViewController *picker= [self.storyboard instantiateViewControllerWithIdentifier:@"main"];    
    
      [self presentModalViewController:picker animated:YES];
 */CGRect fullScreenRect ;
    UIScreen *screen = [UIScreen mainScreen];
    fullScreenRect = screen.bounds;
        NSLog(@"blaaljdakljfkj%f  :%f",mscrollview.frame.size.width, self.mainViev.frame.size.width);
        
}

- (IBAction) iconClicked:(id)sender {
    
   UIButton *current_icon=sender;
    icon_name  = [[NSString alloc] initWithFormat:@"icon%d", current_icon.tag ];
    imageView.image=[UIImage imageNamed:icon_name];
    if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation))
        {
            imageView.frame=CGRectMake(184, 200, 400 , 500);
            // code for Portrait orientation
        }
        
    }else{
       imageView.frame=CGRectMake(60, 60, 200 ,300 ); 
    }
    imageShirt=imageView.image;
    [mainViev setHidden:NO];  
    [mscrollview setHidden:YES];
    [self saveImage:imageShirt withFileName:@"BackSide" ofType:@"png" inDirectory:documentsDirectoryPath];
  
    
}

-(IBAction) goBack:(id) sender{ 
    [mscrollview setHidden:YES];
    [mainViev setHidden:NO];
    count=0;

}

-(IBAction) getFromPhotoLibrary:(id) sender {
   
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
             
        popover = [[UIPopoverController alloc] initWithContentViewController:picker];
        popover.delegate = self;
                         
        [popover presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny  animated:YES];
        
    }else {
        [self presentModalViewController:picker animated:YES];
    }
    

    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissModalViewControllerAnimated:YES];
    imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    imageShirt = imageView.image;
    [self saveImage:imageView.image withFileName:@"BackSide" ofType:@"png" inDirectory:documentsDirectoryPath];
    


}

-(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    }  
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    [mainViev setHidden:NO];
    [mscrollview setHidden:YES];
    imageView.image= imageShirt;
     mscrollview.frame =mainViev.frame;
    
    
    
	// Do any additional setup after loading the view.
}
- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)orientation duration:(NSTimeInterval)duration {
 mscrollview.frame =mainViev.frame;
     NSLog(@"blaaljdakljfkj%f  :%f",mscrollview.frame.size.width, self.mainViev.frame.size.width);
  

    
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL) shouldAutorotate
{
    return NO;
}

@end

