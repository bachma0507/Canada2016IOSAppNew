//
//  SessionDetailInterfaceController.m
//  Canada2016IOSAppNew
//
//  Created by Barry on 11/22/15.
//  Copyright © 2015 BICSI. All rights reserved.
//

#import "SessionDetailInterfaceController.h"

@interface SessionDetailInterfaceController ()

@end

@implementation SessionDetailInterfaceController

@synthesize sessionDescriptionLabel, sessionNameLabel;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    
    NSString * mySessionId = context;
    
    NSLog(@"Value for mySessionId = %@", mySessionId);
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Sessions" inManagedObjectContext:[[CoreDataHelper sharedHelper] context]];
    
    [fetchRequest setEntity:entity];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"sessionID == %@",mySessionId]];
    
    NSArray *myResults = [[[CoreDataHelper sharedHelper] context] executeFetchRequest:fetchRequest error:nil];
    
    self.objectsArray = myResults;
    
    //int i;
    
    //NSManagedObject * items = self.objectsArray[i];
    
    NSManagedObject *item = myResults[0];
    
    [sessionNameLabel setText:[NSString stringWithFormat:@"%@",[item valueForKey:@"sessionName"]]];
    [sessionDescriptionLabel setText:[NSString stringWithFormat:@"%@",[item valueForKey:@"sessionDesc"]]];
    
    NSString * name = [NSString stringWithFormat:@"%@",[self.objectsArray valueForKey:@"sessionName"]];
    NSString * desc = [NSString stringWithFormat:@"%@",[self.objectsArray valueForKey:@"sessionDesc"]];
    
    NSLog(@"Value of name is: %@", name);
    NSLog(@"Value of desc is: %@", desc);
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



