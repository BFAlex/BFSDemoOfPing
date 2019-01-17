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

@interface ViewController () <SimplePingDelegate> {
    NSString *_curHost;
}
@property (weak, nonatomic) IBOutlet UITextView *messageView;

@property (nonatomic, strong) BFSPingAssistant *pingAssistant;
@property (nonatomic, strong) SimplePing *simplePing;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.messageView.text = @"";
}

- (void)testAssistant {
    // 127.0.0.1
    // www.apple.com
    // 192.168.25.1
    // [BFSPingAssistant getIpAddresses]
    _curHost = [BFSPingAssistant getIpAddresses];
    self.pingAssistant = [[BFSPingAssistant alloc] initWithHostName:_curHost forTarget:self selector:@selector(pingResult:)];
    [self.pingAssistant startPing];
}

- (void)pingResult:(id)result {
    NSLog(@"ping result(%@): %@", _curHost, result);
    NSString *newMsg = [NSString stringWithFormat:@"%@\nping result(%@): %@",
                        [self currentTimeStr],
                        _curHost,
                        result ? @"success" : @"fail"];
    self.messageView.text = [NSString stringWithFormat:@"%@\n\n%@", newMsg, self.messageView.text];
    
    
    [self.messageView scrollsToTop];
}

- (NSString *)currentTimeStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *datenow = [NSDate date];
    NSString *nowtimeStr = [formatter stringFromDate:datenow];
    
    return nowtimeStr;
}

#pragma mark - Action

- (IBAction)actionPingBtn:(UIButton *)sender {
    
    [self testAssistant];
}

@end
