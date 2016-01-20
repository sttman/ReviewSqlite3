//
//  Sqlite3Manager.m
//  ReviewSqlite3
//
//  Created by shitaotao on 16/1/20.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import "Sqlite3Manager.h"
#import "FMDB.h"

@interface Sqlite3Manager ()
{
    FMDatabase * _db;
}
@end

@implementation Sqlite3Manager
- (instancetype)init{
    if (self = [super init]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            // 1.打开数据库
            NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"sqlite.db"];
            _db = [FMDatabase databaseWithPath:path];
            [_db open];
            
            // 2.创建表单
            [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_table (id integer PRIMARY KEY, status blob NOT NULL, idstr text NOT NULL);"];
        });
    }
    return self;
}

singleton_m(Sqlite3Manager);

/// 增加数据
- (void)addData:(Sqlite3Node *)data{
    [_db executeUpdateWithFormat:@"INSERT INTO t_table(status, idstr) VALUES (%@, %@);",data.formData, data.idStr];
}

/// 删除数据
- (void)removeAllData{
    [_db executeUpdate:@"DELETE FROM t_table;"];
}
- (void)remover:(Sqlite3Node *)data{
    [_db executeUpdate:[NSString stringWithFormat:@"DELETE FROM t_table WHERE idstr = %@;",data.idStr]];
}

/// 读取数据
- (NSArray *)readData{
    FMResultSet * set = [_db executeQuery:@"SELECT * FROM t_table;"];
    NSMutableArray * arr = [NSMutableArray array];
    // 往下读取
    while (set.next) {
        Sqlite3Node * node = [[Sqlite3Node alloc]init];
        node.formData = [set objectForColumnName:@"status"];
        node.idStr = [set stringForColumn:@"idstr"];
        [arr addObject:node];
    }
    return arr;
}

@end
