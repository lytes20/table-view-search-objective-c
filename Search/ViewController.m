//
//  ViewController.m
//  Search
//
//  Created by Gideon Bamuleseyo on 10/30/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

    {
NSMutableArray *categories;
NSMutableArray *searchResults;
BOOL isFiltered;
    }
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Search";
    categories = [[NSMutableArray alloc] initWithObjects:@"Elela", @"Alela", @"Panquin", @"Danlisha", nil];
    
    isFiltered = false;
    self.searchBar.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
}
    
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0){
        isFiltered = false;
    }else{
        isFiltered = true;
        searchResults = [[NSMutableArray alloc] init];
        
        for(NSString *category in categories){
            NSRange nameRange = [category rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound){
                [searchResults addObject:category];
            }
        }
    }
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(isFiltered){
        return searchResults.count;
    }
    return categories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
    if(isFiltered){
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"products_cell"];
        UILabel *name = [cell viewWithTag:1];
        name.text = searchResults[indexPath.row];
        return cell;
    }else{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"item_cell"];
    UILabel *name = [cell viewWithTag:1];
    name.text = categories[indexPath.row];
        return cell;
    }
    
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(isFiltered){
        return 100;
    }

    return 45;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(isFiltered){
        
    }else{
        [self performSegueWithIdentifier:@"open_second_scene" sender:self];
    }
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
