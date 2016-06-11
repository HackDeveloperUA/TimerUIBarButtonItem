//
//  ViewController.m
//  TimerUIBarButtonItem
//
//  Created by MD on 08.06.16.
//  Copyright © 2016 MD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIBarButtonItem* timerButton;

@property (nonatomic, strong) NSTimer* timer;
@property (strong, nonatomic) NSString* numbeSeconds;
@property (nonatomic, assign) float secondsFloat;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.secondsFloat =  3600.f;
    
    self.timer =  [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                    target: self
                                                  selector:@selector(onTick:)
                                                  userInfo: nil repeats:YES];
    
    self.timerButton = [[UIBarButtonItem alloc] initWithTitle:@"00:00" style:UIBarButtonItemStyleDone target:self action:nil];
    [self.timerButton  setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIFont fontWithName:@"Helvetica-Bold" size:26.0], NSFontAttributeName,
                                              [UIColor greenColor], NSForegroundColorAttributeName, nil]
                              forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItems = @[self.timerButton];
}


#pragma mark - Action

-(void)onTick:(NSTimer *)timer {

    if (self.secondsFloat > 0.0f) {
        self.secondsFloat--;
        
        // NSLog(@"Time : %@ ", [self formatTimeStamp:self.secondsFloat]);
        [UIView performWithoutAnimation:^{
            self.timerButton.title = [self formatTimeStamp:self.secondsFloat];
        }];
        
    } else  if ([_timer isValid]) {
                [_timer invalidate];
    }
    
}

- (NSString *) formatTimeStamp:(float)seconds {
    int sec = floor(fmodf(seconds, 60.0f));
    return [NSString stringWithFormat:@"%02d:%02d",
            (int)floor(seconds/60),             // minutes
            (int)sec                          // seconds
            ];
}

@end
