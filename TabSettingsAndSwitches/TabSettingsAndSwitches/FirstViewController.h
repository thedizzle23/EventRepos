//
//  FirstViewController.h
//  TabSettingsAndSwitches
//
//  Created by Robert DeNicola on 6/10/12.
//  Copyright (c) 2012 Developmental Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate> {
    
    
    IBOutlet UITextField *loginName;
    
    IBOutlet UITextField *password;
    
    IBOutlet UIPickerView *favoriteColor;
    
    
    
    
    
    
}



@property (strong, nonatomic) UITextField *loginName;

@property (strong, nonatomic) UITextField *password;

@property (strong, nonatomic) UIPickerView *favoriteColor;

-(IBAction)loadSettings:(id)sender;

-(IBAction)saveSettings:(id)sender;

-(IBAction)doneEditing:(id)sender;




@end
