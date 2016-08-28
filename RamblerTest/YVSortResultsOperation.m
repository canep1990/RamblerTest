//
//  YVSortResultsOperation.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVSortResultsOperation.h"
#import "YVNewsModel.h"


@interface YVSortResultsOperation()
@property (strong, nonatomic) NSMutableArray <YVNewsModel *> *models;
@end

@implementation YVSortResultsOperation

- (instancetype)initWithLentaResults:(NSArray<YVNewsModel *> *)lentaModels gazetaModels:(NSArray<YVNewsModel *> *)gazetaModels
{
    self = [super init];
    if (self)
    {
        self.models = [[NSMutableArray alloc] initWithArray:lentaModels];
        [self.models addObjectsFromArray:gazetaModels];
    }
    return self;
}

- (void)execute
{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"publicationDate" ascending:NO];
    self.sortedObjects = [self.models sortedArrayUsingDescriptors:@[sortDescriptor]];
    [self finish];
}

@end
