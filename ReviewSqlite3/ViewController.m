//
//  ViewController.m
//  ReviewSqlite3
//
//  Created by shitaotao on 16/1/20.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import "ViewController.h"
#import "Sqlite3Manager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /**
     *  示范
     */
    Sqlite3Manager * mgr = [Sqlite3Manager sharedSqlite3Manager];
    
    /**
     *  添加一段数据   （这个地方不要运行多次，否则会有重复数据）
     */
    for (int i = 1; i < 10; i++) {
        Sqlite3Node * node = [[Sqlite3Node alloc]init];
        node.formData = [NSKeyedArchiver archivedDataWithRootObject:[NSString stringWithFormat:@"这个是乱码数据，没什么用%d",i]];
        node.idStr = [NSString stringWithFormat:@"%d",i];
        [mgr addData:node];
    }
    
    
    
    
    /**
     *  删除一条数据
     */
//    Sqlite3Node * node = [[Sqlite3Node alloc]init];
//    node.idStr = [NSString stringWithFormat:@"4"];
//    [mgr remover:node];
    
    
    
    /**
     *  删除整张表
     */
//    [mgr removeAllData];
    
    
    
    /**
     *  查询数据，打印了数据本身的id。
     */
    NSArray * arr = [mgr readData];
    for (Sqlite3Node * node in arr) {
        NSLog(@"%@",node.idStr);
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
