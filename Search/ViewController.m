//
//  ViewController.m
//  Search
//
//  Created by Gideon Bamuleseyo on 10/30/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property (strong, nonatomic) NSMutableArray *categories;
    @property (strong, nonatomic) NSMutableArray *searchResults;;
    @property (strong, nonatomic) NSIndexPath *expandedIndexPath;
    @property (assign) BOOL isFiltered;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Search";
    _categories = [[NSMutableArray alloc] initWithObjects:@"Elela", @"Alela", @"Panquin", @"Danlisha", nil];
    
    _isFiltered = false;
    self.searchBar.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
}
    
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0){
        _isFiltered = false;
    }else{
        _isFiltered = true;
        _searchResults = [[NSMutableArray alloc] init];
        
        for(NSString *category in _categories){
            NSRange nameRange = [category rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound){
                [_searchResults addObject:category];
            }
        }
    }
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(_isFiltered){
        return _searchResults.count;
    }
    return _categories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
    if(_isFiltered){
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"products_cell"];
        UILabel *name = [cell viewWithTag:1];
        name.text = _searchResults[indexPath.row];
        return cell;
    }else{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"item_cell"];
    UILabel *name = [cell viewWithTag:1];
    name.text = _categories[indexPath.row];
        return cell;
    }
    
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_isFiltered){
        if ([indexPath compare:self.expandedIndexPath] == NSOrderedSame) {
            return 180; // + moreheight;
        }
        return 55;
    }

    return 45;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(_isFiltered){
        [tableView beginUpdates];
        
        NSIndexPath *oldIndexPath = self.expandedIndexPath;
        if ([indexPath compare:self.expandedIndexPath] == NSOrderedSame) {
            self.expandedIndexPath = nil;
        } else {
            self.expandedIndexPath = indexPath;
        }
        
        if (oldIndexPath == nil) {
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }else {
            [tableView reloadRowsAtIndexPaths:@[oldIndexPath, indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
        
        [tableView endUpdates];
    }else{
        [self performSegueWithIdentifier:@"open_second_scene" sender:self];
    }
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
