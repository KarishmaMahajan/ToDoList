//
//  SecondViewController.m
//  KMToDoList
//
//  Created by Student P_03 on 03/10/16.
//  Copyright © 2016 Karishma mhajan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)taskSave {
    NSString *task = self.textField.text;
    if(task.length >0)
        
    {
        NSString *insertQuery = [NSString stringWithFormat: @"INSERT INTO TASK_TABLE(TASK_ID,TASK) VALUES('%@','%@')",task.uppercaseString,task];
        NSLog(@"%@",insertQuery);
        
        int result = [[KMDatabaseManager sharedManager]executeQuery:insertQuery];
        
        if(result == 1)
        {
            NSLog(@"Successful inserted task");
        
        }
        else
        {
            NSLog(@"Unable to insert task in SqLite Database");
        }
        NSLog(@"task save");
       self.textField.text = @"";
    }
    else
    {
        NSLog(@"Enter the task first to Save");
        
    }
    [self.textField resignFirstResponder];

    
}


-(BOOL)isTextFieldShouldReturn:(UITextField *) textField {
    [textField resignFirstResponder];
    [self taskSave];
    return YES;
    
}

- (IBAction)actionSave:(id)sender {
    [self taskSave];
    
}
@end
