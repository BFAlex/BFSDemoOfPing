//
//  ViewController.m
//  BFSDemoOfPing
//
//  Created by 刘玲 on 2019/1/16.
//  Copyright © 2019年 BFS. All rights reserved.
//

#import "ViewController.h"
#import "BFSPingAssistant.h"

#import "SimplePing.h"

@interface ViewController () <SimplePingDelegate>
@property (nonatomic, strong) BFSPingAssistant *pingAssistant;

@property (nonatomic, strong) SimplePing *simplePing;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testAssistant];
//    [self pingHost];
}

- (void)testAssistant {
    // 127.0.0.1
    // www.apple.com
    // 192.168.25.1
    self.pingAssistant = [[BFSPingAssistant alloc] initWithHostName:@"127.0.0.1" forTarget:self selector:@selector(pingResult:)];
    [self.pingAssistant startPing];
}

- (void)pingResult:(id)result {
    NSLog(@"ping result: %@", result);
}

#pragma mark -

//- (void)pingHost {
//
//    NSString *hostName = @"www.apple.com";
//    self.simplePing = [[SimplePing alloc] initWithHostName:hostName];
//    self.simplePing.addressStyle = SimplePingAddressStyleICMPv4;
//    self.simplePing.delegate = self;
//    [self.simplePing start];
//}
//
//#pragma mark SimplePingDelegate
//
//- (void)simplePing:(SimplePing *)pinger didStartWithAddress:(NSData *)address {
//    NSLog(@"【%@ %@】", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
//    [self.simplePing sendPingWithData:nil];
//}
//
//- (void)simplePing:(SimplePing *)pinger didFailWithError:(NSError *)error {
//    NSLog(@"【%@ %@】", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
//}
//
//- (void)simplePing:(SimplePing *)pinger didSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber {
//    NSLog(@"【%@ %@】", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
//}
//
//- (void)simplePing:(SimplePing *)pinger didFailToSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber error:(NSError *)error {
//    NSLog(@"【%@ %@】", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
//}
//
//- (void)simplePing:(SimplePing *)pinger didReceivePingResponsePacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber {
//    NSLog(@"【%@ %@】", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
//}
//
//- (void)simplePing:(SimplePing *)pinger didReceiveUnexpectedPacket:(NSData *)packet {
//    NSLog(@"【%@ %@】", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
//    NSLog(@"didReceiveUnexpectedPacket: %@", [[NSString alloc] initWithData:packet encoding:NSUTF8StringEncoding]);
//}


@end
