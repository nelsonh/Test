//
//  ViewController.h
//  SocketTest
//
//  Created by tomneo2004 on 12/11/28.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ViewController : UIViewController<NSStreamDelegate>
{
    NSInputStream *inputStram;
    NSOutputStream *outputStream;
}

@end
