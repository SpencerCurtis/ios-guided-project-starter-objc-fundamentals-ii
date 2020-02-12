//
//  LSITipViewController.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipViewController.h"
#import "LSITipController.h"
#import "LSITip.h"

@interface LSITipViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField;
@property (weak, nonatomic) IBOutlet UILabel *splitLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIStepper *splitStepper;
@property (weak, nonatomic) IBOutlet UISlider *percentageSlider;

@property (nonatomic) double total;
@property (nonatomic) NSInteger split;
@property (nonatomic) double percentage;
@property (nonatomic) LSITipController *tipController;

- (void)calculateTip;
- (void)updateViews;


@end

@implementation LSITipViewController

- (void)viewDidLoad {
    self.tipController = [[LSITipController alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (IBAction)updateSplit:(id)sender {
    
}

- (IBAction)updatePercentage:(id)sender {
    
}

- (IBAction)saveTip:(id)sender {
    
}

- (void)calculateTip {
    
}

- (void)updateViews {
    
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tipController.tips count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipCell" forIndexPath:indexPath];
       
       LSITip *tip = [self.tipController.tips objectAtIndex:indexPath.row];
       
       cell.textLabel.text = tip.name;
       
       return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
