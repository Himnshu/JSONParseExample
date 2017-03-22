//
//  ViewController.m
//  JSONParseExample
//
//  Created by osx on 22/03/17.
//  Copyright © 2017 com.domain.JSONParseExample. All rights reserved.
//

#import "ViewController.h"

#import "Color.h"

#import "Cell.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *mTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    marrAllColors = [[NSMutableArray alloc] init];
    
    [self parseJSONFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)parseJSONFile
{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Displaydata" ofType:@"json"]];
    
    NSDictionary *dictTemp = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *arrColors = [dictTemp valueForKey:@"colorsArray"];
    
    for (int i=0; i<arrColors.count; i++) {
        Color *colors = [[Color alloc] init];
        [colors parseResponse:[arrColors objectAtIndex:i]];
        [marrAllColors addObject:colors];
    }
    
    [self displayAllColros];
}

-(void)displayAllColros
{
    for (int i=0; i<marrAllColors.count; i++) {
        Color *color = [marrAllColors objectAtIndex:i];
        NSLog(@"Color : Name = %@ hexValue = %@",color.colorName,color.hexValue);
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return marrAllColors.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    Cell *cell = (Cell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Color *color = [marrAllColors objectAtIndex:indexPath.row];
    NSLog(@"Color : Name = %@ hexValue = %@",color.colorName,color.hexValue);
    
    NSString *str = [color.colorName stringByAppendingString:color.hexValue];
    
    cell.colorName.text = str;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
}


@end
