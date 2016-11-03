//
//  KMDatabaseManager.h
//  KMToDoList
//
//  Created by Student P_03 on 03/10/16.
//  Copyright © 2016 Karishma mhajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface KMDatabaseManager : NSObject
{
    sqlite3 *myDB;
 
}
+(instancetype)sharedManager;

-(NSString *)getDatabasePath;

-(int)executeQuery:(NSString *)query;

-(NSMutableArray *)getAllTask;



@end
