//
//  MCMainViewController.m
//  MemCards
//
//  Created by Vania on 10.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCMainViewController.h"

@interface MCMainViewController ()

@end

@implementation MCMainViewController
@synthesize highScore;
-(IBAction)playButton:(id)sender{
    
    [highScore setText:@"0"];
    
}

- (IBAction)playMusic {
    [[MCSoundSystem sharedSoundSystem] playMusic:@"music"];
}

- (IBAction)play {
    [[MCSoundSystem sharedSoundSystem] play];
}

- (IBAction)stop {
    [[MCSoundSystem sharedSoundSystem] pause];
}

- (IBAction)playEffect {
    [[MCSoundSystem sharedSoundSystem] playEffect:@"click"];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end