//
//  ViewController.m
//  RunloopTest
//
//  Created by baidu on 15/12/6.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    CFStringRef runloopMode = kCFRunLoopDefaultMode;
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"runloop 空闲时间");
        
        if (/* DISABLES CODE */ (NO)) {
            //移除observer
            CFRunLoopRemoveObserver(runloop, observer, runloopMode);
            CFRelease(observer);
            return;
        }
//        //手动向 RunLoop 中添加 Source 任务（由应用发起和处理的是 Source 0 任务）
//        [self performSelector:@selector(selector) onThread:[NSThread mainThread] withObject:param waitUntilDone:NO modes:@[NSDefaultRunLoopMode]];
        
    });
    CFRunLoopAddObserver(runloop, observer, runloopMode);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
