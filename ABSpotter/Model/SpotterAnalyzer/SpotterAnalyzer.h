//
//  SpotterAnalyzer.h
//  ABSpotter
//
//  Created by Abilash Cumulations on 12/09/17.
//  Copyright © 2017 Abilash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SpotterAnalyzer : NSObject
+ (SpotterAnalyzer *)sharedAnalyzer;
- (void)processImage:(UIImage *)image;
@end
