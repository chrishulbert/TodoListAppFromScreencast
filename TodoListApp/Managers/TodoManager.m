//
//  TodoManager.m
//  TodoListApp
//
//  Created by Chris on 2/04/13.
//  Copyright (c) 2013 Splinter Software. All rights reserved.
//

#import "TodoManager.h"

#import "TodoItem.h"

static NSString *kFileName = @"todo_items.json";

@implementation TodoManager

+ (instancetype)sharedManager {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init {
    if (self = [super init]) {
        [self load];
    }
    return self;
}

- (void)save {
    // Convert model objects to json-compatible dictionaries.
    NSMutableArray *todoItemsAsDictionaries = [NSMutableArray array];
    for (TodoItem *item in _items) {
        [todoItemsAsDictionaries addObject:[item jsonDictionary]];
    }
    NSDictionary *json = @{@"items":todoItemsAsDictionaries};
    
    // Save it.
    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:0 error:nil];
    [data writeToFile:[self path] atomically:YES];
}

#pragma mark - Private

- (NSString *)path {
    NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,
                                                             YES)[0];
    return [docsPath stringByAppendingPathComponent:kFileName];
}

- (void)load {
    NSData *data = [NSData dataWithContentsOfFile:[self path]];
    if (data) {
        // File exists.
        _items = [NSMutableArray array];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *itemDict in json[@"items"]) {
            TodoItem *item = [[TodoItem alloc] initWithJsonDictionary:itemDict];
            [_items addObject:item];
        }
    } else {
        // File missing (first launch of app).
        _items = [NSMutableArray array];
    }
}

@end
