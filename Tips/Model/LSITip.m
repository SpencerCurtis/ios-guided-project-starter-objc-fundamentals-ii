//
//  LSITip.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITip.h"

@implementation LSITip

-(instancetype)initWithName:(NSString *)name
                      total:(double)total
                 splitCount:(NSInteger)splitCount
              tipPercentage:(double)tipPercentage
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _total = total;
        _splitCount = splitCount;
        _tipPercentage = tipPercentage;
    }
    
    return self;
}

@end
