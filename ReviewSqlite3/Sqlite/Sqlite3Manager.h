//
//  Sqlite3Manager.h
//  ReviewSqlite3
//
//  Created by shitaotao on 16/1/20.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingLenton.h"
#import "Sqlite3Node.h"
@interface Sqlite3Manager : NSObject

/**
 @return DatabaseManager
 */

singleton_h(Sqlite3Manager);
/// 增加数据
- (void)addData:(Sqlite3Node *)data;

/// 删除数据
- (void)removeAllData;
- (void)remover:(Sqlite3Node *)data;

/// 读取数据
- (NSArray *)readData;
@end
