//
//  Sqlite3Node.h
//  ReviewSqlite3
//
//  Created by shitaotao on 16/1/20.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sqlite3Node : NSObject
/**
 *  将一条数据打包层NSData储存
 */
@property (nonatomic, strong) NSData * formData;
/**
 *  每条数据的id
 */
@property (nonatomic, copy) NSString * idStr;
@end
