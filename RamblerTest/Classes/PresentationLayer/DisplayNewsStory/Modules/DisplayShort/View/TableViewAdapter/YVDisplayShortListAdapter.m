//
//  YVDisplayShortList.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDisplayShortListAdapter.h"

@implementation YVDisplayShortListAdapter

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YVDisplayShortListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:YVDisplayShortListTableCellReuseIdentifier];
    [cell configureCellWithNewsModel:self.modelsArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(displayShortListAdapter:didSelectModel:)])
    {
        [self.delegate displayShortListAdapter:self didSelectModel:self.modelsArray[indexPath.row]];
    }
}

@end
