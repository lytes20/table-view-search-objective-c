//
//  ViewController.h
//  Search
//
//  Created by Gideon Bamuleseyo on 10/30/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    @property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
    

@end

