//
//  AttributeViewController.m
//  Attribute
//
//  Created by Thijs Hosman on 2/25/13.
//  Copyright (c) 2013 Thijs Hosman. All rights reserved.
//

#import "AttributeViewController.h"

@interface AttributeViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *wordStepper;
@property (weak, nonatomic) IBOutlet UILabel *wordSelectorLabel;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation AttributeViewController

- (NSArray *)wordList
{
    NSArray *wordList = [[self.label.attributedText string] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([wordList count]) {
        return wordList;
    } else { //make sure you don't return an empty array
        return @[@""];
    }
}

-(NSString *)selectedWord
{
    return [self wordList][(int)self.wordStepper.value];
}

- (IBAction)updateSelectedWord {
    self.wordStepper.maximumValue = [[self wordList] count] -1;
    self.wordSelectorLabel.text = [self selectedWord];
    //wordList[(int)self.wordStepper.value];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self updateSelectedWord];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setWordAttributes:(NSDictionary *)atts range:(NSRange)aRange
{
    

    if (aRange.location != NSNotFound) {
        NSMutableAttributedString *mat = [self.label.attributedText mutableCopy];
        [mat addAttributes:atts range:aRange];
        self.label.attributedText = mat;
    }
}

-(void)addWordAttributes:(NSDictionary *)atts
{
    NSRange range = [[self.label.attributedText string] rangeOfString:[self selectedWord]];
    [self setWordAttributes:atts range:range];
}

- (IBAction)colorButton:(id)sender {
    [self addWordAttributes:@{NSForegroundColorAttributeName : [sender backgroundColor]}];
}


//- (IBAction)colorButton:(id)sender {
//    NSLog(@"%@", [sender name]);
    //
    //[self addWordAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]}];
//}

@end
