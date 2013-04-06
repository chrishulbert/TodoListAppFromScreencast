//
//  NewTodoItemViewController.m
//  TodoListApp
//
//  Created by Chris on 2/04/13.
//  Copyright (c) 2013 Splinter Software. All rights reserved.
//

#import "NewTodoItemViewController.h"

#import "NewTodoItemView.h"
#import "TodoManager.h"
#import "TodoItem.h"

@implementation NewTodoItemViewController {
    NewTodoItemView *_newTodoItemView;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"New Todo";
        self.navigationItem.rightBarButtonItem =
            [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemSave)
                                                          target:self
                                                          action:@selector(tapSave)];
    }
    return self;
}

- (void)tapSave {
    TodoItem *newItem = [[TodoItem alloc] init];
    
    newItem.title = _newTodoItemView.title.text;
    
    [[TodoManager sharedManager].items addObject:newItem];
    [[TodoManager sharedManager] save];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadView {
    _newTodoItemView = [[NewTodoItemView alloc] init];
    self.view = _newTodoItemView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
