//
//  KMDatabaseManager.m
//  KMToDoList
//
//  Created by Student P_03 on 03/10/16.
//  Copyright © 2016 Karishma mhajan. All rights reserved.
//

#import "KMDatabaseManager.h"

@interface KMDatabaseManager ()

@end

@implementation KMDatabaseManager

+(instancetype)sharedManager {
    
    static KMDatabaseManager *sharedInstance;
    
    if (sharedInstance == nil) {
        sharedInstance = [[KMDatabaseManager alloc]init];
    }
    
    return sharedInstance;
    
}

-(NSString *)getDatabasePath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/SBDatabase.sqlite"];
}


-(int)executeQuery:(NSString *)query {
    
    int success = 0;
    sqlite3_stmt *statement;
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                success = 1;
            }
        }
        
        sqlite3_close(myDB);
    }
    
    
    
    return success;
    
}

-(NSMutableArray *)getAllTask {
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT TASK FROM TASK_TABLE";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, nil) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char * taskString = (const char *)sqlite3_column_text(statement, 0);
                
                
                
                NSString *task = [NSString stringWithUTF8String:taskString];
                
                [mArray addObject:task];
                
                
                
            }
            
        }
        
        sqlite3_close(myDB);
    }
    
    return mArray;
    
}



@end
