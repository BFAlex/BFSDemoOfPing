//
//  BFSPingAssistant.h
//  BFSDemoOfPing
//
//  Created by 刘玲 on 2019/1/16.
//  Copyright © 2019年 BFS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFSPingAssistant : NSObject

#pragma mark - Class methods
+ (NSString *)getIpAddresses;

#pragma mark - Obj methods
- (instancetype)init __attribute__((unavailable("init is unavailable, call\"initWithHostName:theTarget:\"instead")));
- (instancetype)initWithHostName:(NSString *)hostName forTarget:(id)target selector:(SEL)selector;
// Start Ping
- (void)startPing;
- (void)finishPing;


@end

NS_ASSUME_NONNULL_END
