//
//  TodoItem.h
//  TodoListApp
//
//  Created by Chris on 2/04/13.
//  Copyright (c) 2013 Splinter Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject

@property NSString *title;

- (id)initWithJsonDictionary:(NSDictionary *)json;

- (NSDictionary *)jsonDictionary;

@end
