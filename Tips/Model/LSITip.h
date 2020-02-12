//
//  LSITip.h
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSITip : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) double total;
@property (nonatomic, readonly) NSInteger splitCount;
@property (nonatomic, readonly) double tipPercentage;

-(instancetype)initWithName:(NSString *)name
                      total:(double)total
                 splitCount:(NSInteger)splitCount
              tipPercentage:(double)tipPercentage;

@end

NS_ASSUME_NONNULL_END
