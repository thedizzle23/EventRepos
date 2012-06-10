//
//  FirstViewController.m
//  TabSettingsAndSwitches
//
//  Created by Robert DeNicola on 6/10/12.
//  Copyright (c) 2012 Developmental Applications. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController


@synthesize loginName, password, favoriteColor;



NSMutableArray *colors;
NSString *favoriteColorSelected;





-(IBAction)loadSettings:(id)sender {
    
    
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    loginName.text = [defaults objectForKey:@"login_name"];
    password.text = [defaults objectForKey:@"password"];
    
    
    
    //---find the index of the array for the color saved---//
    
    favoriteColorSelected = [[NSString alloc] initWithString:[defaults objectForKey:@"color"]];
    
    int selIndex = [colors indexOfObject:favoriteColorSelected];
    
    
    //---display the saved color in the Picker View---//
    
    
    [favoriteColor selectRow:selIndex inComponent:0 animated:YES];
    
    
    
    
    
    
    
    
    
    
    
}






-(IBAction)saveSettings:(id)sender {
    
    
    
    
    
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:loginName.text forKey:@"login_name"];
    [defaults setObject:password.text forKey:@"password"];
    [defaults setObject:favoriteColorSelected forKey:@"color"];
    [defaults synchronize];
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Settings Saved!"
                          message:@"Values Accepted!"
                          delegate:self 
                          cancelButtonTitle:@"Done"
                          otherButtonTitles:nil];
    [alert show];
    
    
    
    
    
    
    
    
}












-(IBAction)doneEditing:(id)sender {
    
    
    
    
    [sender resignFirstResponder];
    
    
    
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    //create simple array containing all color values//
    
    colors = [[NSMutableArray alloc] init];
    [colors addObject:@"Red"];
    [colors addObject:@"Green"];
    [colors addObject:@"Blue"];
    
    password.secureTextEntry = YES;
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



//number of components within the pickerview!///

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    
    return 1;
    
    
    
}

//----number of items(rows) within the UIPickerView!!---//

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    
    return [colors count];
    
    
    
    
    
    
    
}


///need to save and get retuen value of the pickerview strings themselves by tonights deadline!!//

//---populating the Picker View---//


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    
    return [colors objectAtIndex:row];
    
    
    
    
}





//--the item selected by the user--//


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {//similar to tableview method actually//
    
    
    
    
    
    
    favoriteColorSelected = [colors objectAtIndex:row];
    
    //return object for each row in the table//
    
    
    
    
    
}







- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
