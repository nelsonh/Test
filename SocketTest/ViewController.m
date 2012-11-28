//
//  ViewController.m
//  SocketTest
//
//  Created by tomneo2004 on 12/11/28.
//
//

#import "ViewController.h"

@interface ViewController ()

-(IBAction)startConnection:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startConnection:(id)sender
{
    int code = 0;
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"183.82.66.239", 10243, &readStream, &writeStream);
    
    inputStram = (__bridge NSInputStream*)readStream;
    outputStream = (__bridge NSOutputStream*)writeStream;
    
    inputStram.delegate = self;
    outputStream.delegate = self;
    
    [inputStram scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

    [inputStram open];
    [outputStream open];
    
    NSString *respond = [NSString stringWithFormat:@"getsid%@\n", @""];
    NSData *data = [[NSData alloc] initWithData:[respond dataUsingEncoding:NSASCIIStringEncoding]];
    code = [outputStream write:[data bytes] maxLength:[data length]];
    
    NSLog(@"code:%i", code);
    NSLog(@"error:%@", [outputStream streamError]);

    
    respond = [NSString stringWithFormat:@"%@%@\n", @"james1", @"pweptd11"];
    data = [[NSData alloc] initWithData:[respond dataUsingEncoding:NSASCIIStringEncoding]];
    code = [outputStream write:[data bytes] maxLength:[data length]];
    
    NSLog(@"data send");
}

-(void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{
    
}

@end
