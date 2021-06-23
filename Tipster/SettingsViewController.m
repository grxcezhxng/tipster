//
//  SettingsViewController.m
//  Tipster
//
//  Created by gracezhg on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipDefaultControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    int defaultIndex = [defaults integerForKey:@"default_tip_index"];
    [self.tipDefaultControl setSelectedSegmentIndex:defaultIndex];
}

- (IBAction)updateDefaultTip:(id)sender {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    int defaultPercent = self.tipDefaultControl.selectedSegmentIndex;
    [defaults setInteger:defaultPercent forKey:@"default_tip_index"];
    [defaults synchronize];
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
