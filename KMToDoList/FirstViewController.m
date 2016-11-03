//
//  FirstViewController.m
//  KMToDoList
//
//  Created by Student P_03 on 03/10/16.
//  Copyright © 2016 Karishma mhajan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    allTasks = [[NSMutableArray alloc]init];
    
}


-(void)viewDidAppear:(BOOL)animated {
    [self reloadTask];
}

-(void)reloadTask {
    allTasks = [[KMDatabaseManager sharedManager]getAllTask];
    
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return allTasks.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [allTasks objectAtIndex:indexPath.row];
    
    return cell;
}

    
       -(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
        
        NSLog(@"Delete");
        
        
        NSString *task = [allTasks objectAtIndex:indexPath.row];
        
        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM TASK_TABLE WHERE TASK_ID = '%@'",task.uppercaseString];
        
        if ([[KMDatabaseManager sharedManager]executeQuery:deleteQuery] == 1) {
            NSLog(@"Successfully Deleted");
            [self reloadTask];
        }
        else {
            NSLog(@"Failed to Delete Task.");
            
        }
        
        
    }
    
    @end

    
    
    



    
    
    
    
    
    
    
    
    


