//
//  BingViewController.m
//  Bing
//
//  Created by David Michael Jones on 22/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BingViewController.h"
#import "theResults.h"
#import "tableCell.h"
#import "web.h"

@implementation BingViewController
@synthesize offValue;
@synthesize stuff;


- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    stuff = nil;
    
    [self searchBing:theSearchField.text];
    
    [theTableView reloadData];
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void) searchBing:(NSString *)text{
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@%@", @"http://api.search.live.net/json.aspx?Appid=8AC5084174FD8D2A936CC33E0575778143C88396&query=",text,@"&sources=web&web.offset=",offValue];
    
    NSLog(@"JSON: %@",urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    [self getData:data];
}

-(void) getData:(NSData *)response{
    
    NSError *error;
    
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&error];
    // NSLog(@"%@",json);
    
    NSMutableDictionary *searchReponse = [json objectForKey:@"SearchResponse"];
    
    NSMutableDictionary *web = [searchReponse objectForKey:@"Web"];
    
    NSMutableArray *results = [web objectForKey:@"Results"];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [results count]; i++) {
        theResults *result = [[theResults alloc] initWithTitle:[[results objectAtIndex:i] objectForKey:@"Title"]
                                                           url:[[results objectAtIndex:i] objectForKey:@"Url"]
                                                   description:[[results objectAtIndex:i] objectForKey:@"Descripton"]];
        
        [temp addObject:result];
    }
    
    if (stuff){
        stuff = [[NSMutableArray alloc] initWithArray:(NSMutableArray *)[stuff arrayByAddingObjectsFromArray:temp]];
    }else{
        stuff = [[NSMutableArray alloc] initWithArray:temp];
    }
    
    [theTableView reloadData];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    offValue = @"0";
    
   /* theSearchField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 280, 30)];
    
    [theSearchField setBorderStyle:UITextBorderStyleRoundedRect];
    
    theSearchField.returnKeyType = UIReturnKeyDone;
    
    theSearchField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    theSearchField.delegate = self;*/
    
    //[self.view addSubview:theSearchField];
    [theTableView setDataSource:self];
    
   // self.view.backgroundColor = [UIColor yellowColor];
    
    /*theTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 320, 360)];
    
    [theTableView setRowHeight:45];
    
   
    
    
    
    [self.view addSubview:theTableView];*/
    
     [theTableView setDelegate:self];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(stuff){
        return [stuff count] +1;
    }else{
        return 0;
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    tableCell *cell = (tableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[tableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    
    if (indexPath.row < [stuff count]){
        theResults *temp = [stuff objectAtIndex:indexPath.row];
        
        cell.titleLabel.text = temp.title;
        
        cell.descriptionLabel.text = temp.description;
        
        cell.urlLabel.text = temp.url;
    }
    else{
        
        cell.titleLabel.text = @"More";
        
        cell.descriptionLabel.text = @"";
        
        cell.urlLabel.text = @"";
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"click");
    
    if(indexPath.row < [stuff count]){
        NSLog(@"click 1");
        
        [theTableView deselectRowAtIndexPath:indexPath animated:YES];
        
        //web *newWeb = [[web alloc] init];
        
        
        
        //DetailViewController *detail = [[DetailViewController alloc] init];
        //Do whatever you need to do to set values on the detail view controller
        //[self.navigationController pushViewController:detail animated:YES];
        
       /* newWeb.results = [stuff objectAtIndex:indexPath.row];
        
        NSLog(@"test %@",newWeb.results);
        [self.navigationController pushViewController:newWeb animated:YES];
        
         */
        web *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
        detail.results = [stuff objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
        
        NSLog(@"nav controller = %@", self.navigationController);
        
       // [self.navigationController pushViewController:newWeb animated:YES];
    }else{
        NSLog(@"click 2");
        offValue = [NSString stringWithFormat:@"%d",[offValue intValue] +10];
        
        [self searchBing:theSearchField.text];
    }
}

- (void)viewDidUnload {
    theSearchField = nil;
    [super viewDidUnload];
}
@end
