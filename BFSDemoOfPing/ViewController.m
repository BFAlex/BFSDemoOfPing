//
//  ViewController.m
//  BFSDemoOfPing
//
//  Created by 刘玲 on 2019/1/16.
//  Copyright © 2019年 BFS. All rights reserved.
//

#import "ViewController.h"
#import "BFSPingAssistant.h"

@interface ViewController ()
@property (nonatomic, strong) BFSPingAssistant *pingAssistant;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testAssistant];
}

- (void)testAssistant {
    // 127.0.0.1
    self.pingAssistant = [[BFSPingAssistant alloc] initWithHostName:@"www.apple.com" forTarget:self selector:@selector(pingResult:)];
    [self.pingAssistant startPing];
}

- (void)pingResult:(id)result {
    NSLog(@"ping result: %@", result);
}

@end
