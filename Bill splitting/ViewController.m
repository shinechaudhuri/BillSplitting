//
//  ViewController.m
//  Bill splitting
//
//  Created by Shine Chaudhuri on 2015-08-17.
//  Copyright (c) 2015 Shine Chaudhuri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *numberofPeopleSlider;
@property (weak, nonatomic) IBOutlet UILabel *amountPerPersonTextField;
@property (weak, nonatomic) IBOutlet UILabel *showNumOfPeople;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //update Amount per person value while Sliding
    [self.numberofPeopleSlider addTarget:self action:@selector(calculateSplit) forControlEvents: UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)didSliderShowNum:(UISlider *)sender {

    NSLog(@"slider value = %f", sender.value);
    [self.numberofPeopleSlider addTarget: self action:@selector(didSliderShowNum:) forControlEvents:UIControlEventValueChanged];
    
    int numberOfPeopleSplittingTheBill = (int) self.numberofPeopleSlider.value;
    
    self.showNumOfPeople.text = [NSString stringWithFormat:@"%i", numberOfPeopleSplittingTheBill];
}


- (void)calculateSplit {
    
    float peopleAmount = self.numberofPeopleSlider.value;
    double billAmount = self.billAmountTextField.text.doubleValue;
    
    double totalSplit = billAmount / peopleAmount;
    
    self.amountPerPersonTextField.text = [NSString stringWithFormat:@"$%.2f", totalSplit];
    
}

- (IBAction)didTapCalculateButton:(UIButton *)sender {
    [self calculateSplit];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
    [self calculateSplit];
}
@end
