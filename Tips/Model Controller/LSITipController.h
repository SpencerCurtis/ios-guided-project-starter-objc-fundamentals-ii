//
//  LSITipController.h
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSITip;

NS_ASSUME_NONNULL_BEGIN

@interface LSITipController : NSObject

@property (nonatomic, copy) NSArray<LSITip*> *tips;

-(void)createTipWithName:(NSString *)name
                   total:(NSInteger)total
              splitCount:(NSInteger)splitCount
           tipPercentage:(NSInteger)tipPercentage;

@end

NS_ASSUME_NONNULL_END
