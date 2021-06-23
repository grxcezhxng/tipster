//
//  TipViewController.m
//  Tipster
//
//  Created by gracezhg on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    float bill = [self.billAmountField.text doubleValue];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    int defaultIndex = [defaults integerForKey:@"default_tip_index"];
    [self.tipPercentageControl setSelectedSegmentIndex:defaultIndex];
    [defaults synchronize];

    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double tip = bill * tipPercentage;
    double total = bill + tip;

    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:true];
}

- (IBAction)updateLabels:(id)sender {
    double bill = [self.billAmountField.text doubleValue];
    if(bill ==  0) {
        [self hideLabels];
    }
    else {
        [self showLabels];
    }

    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (void)hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y = 400;
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y = 800;
        self.labelsContainerView.frame = labelsFrame;
        self.labelsContainerView.alpha = 0;
    }];
}

- (void)showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        self.labelsContainerView.alpha = 1;
        
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y = 185;
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y = 350;
        self.labelsContainerView.frame = labelsFrame;
        
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
