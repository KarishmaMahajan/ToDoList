//
//  SecondViewController.h
//  KMToDoList
//
//  Created by Student P_03 on 03/10/16.
//  Copyright © 2016 Karishma mhajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMDatabaseManager.h"
@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *buttonSave;
- (IBAction)actionSave:(id)sender;

@end

