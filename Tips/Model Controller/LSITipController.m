//
//  LSITipController.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipController.h"
#import "LSITip.h"

@interface LSITipController ()

@property (nonatomic) NSMutableArray<LSITip *> *internalTips;

@end

@implementation LSITipController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        LSITip *tip = [[LSITip alloc] initWithName:@"Cheesecake Factory"
                                             total:52
                                        splitCount:2
                                     tipPercentage:25];
        _internalTips = [[NSMutableArray alloc] initWithObjects: tip, nil];
    }
    return self;
}

- (void)createTipWithName:(NSString *)name
                    total:(NSInteger)total
               splitCount:(NSInteger)splitCount
            tipPercentage:(NSInteger)tipPercentage
{
    LSITip *tip = [[LSITip alloc] initWithName:name
                                         total:total
                                    splitCount:splitCount
                                 tipPercentage:tipPercentage];
    
    
    
    [self.internalTips addObject:tip];
}

- (NSArray<LSITip *> *)tips
{
    return [self.internalTips copy];
}

@end
