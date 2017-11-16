//
//  ViewController.m
//  中文转拼音
//
//  Created by mac on 2017/9/28.
//  Copyright © 2017年 Lucyf. All rights reserved.
//

#import "ViewController.h"
#import "NSString+PinYin.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *TextInput;

@property (weak, nonatomic) IBOutlet UILabel *LabPinYinTone;
@property (weak, nonatomic) IBOutlet UILabel *LabPinYin;
@property (weak, nonatomic) IBOutlet UILabel *LabFisrtLetter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.TextInput.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.TextInput resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)transform:(id)sender {
    NSString *chineseStr = self.TextInput.text;
    self.LabPinYinTone.text = [chineseStr transformToFirstLetterAndPinyin];
    self.LabPinYin.text = [chineseStr transformToPinyin];
    self.LabFisrtLetter.text = [chineseStr transformToPinyinTone];
    
    
    
}

@end
