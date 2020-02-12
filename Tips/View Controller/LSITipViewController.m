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
    
    [self calculateTip];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (IBAction)updateSplit:(id)sender {
    [self calculateTip];
}

- (IBAction)updatePercentage:(id)sender {
    [self calculateTip];
}

- (IBAction)saveTip:(id)sender {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Save Tip"
                                message:@"What name would you like to give to this tip?"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Tip Name:";
    }];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save"
                                                         style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *name = [[alert.textFields firstObject] text];
        
        [self.tipController createTipWithName: name
                                        total: self.total
                                   splitCount: self.split
                                tipPercentage: self.percentage];
        
        [self.tableView reloadData];
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)calculateTip {
    self.total = [self.totalTextField.text doubleValue];
    
    self.split = self.splitStepper.value;
    self.splitLabel.text = [NSString stringWithFormat:@"%d", (int)self.splitStepper.value];
    
    int roundedPercentage = (int)self.percentageSlider.value;
    self.percentage = roundedPercentage;
    self.percentageLabel.text = [NSString stringWithFormat:@"%d", roundedPercentage];
    
    double tip = self.total * (self.percentage / 100) / self.split;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
}

- (void)updateViews {
    self.splitStepper.value = self.split;
    self.percentageSlider.value = self.percentage;
    self.totalTextField.text = [NSString stringWithFormat:@"%.2f", self.total];
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
    
    LSITip *tip = [self.tipController.tips objectAtIndex:indexPath.row];
    
    self.total = tip.total;
    self.split = tip.splitCount;
    self.percentage = tip.tipPercentage;
    
    [self updateViews];
    [self calculateTip];
}

@end
