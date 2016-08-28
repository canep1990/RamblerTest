//
//  YVDisplayShortListViewControllerTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "YVDisplayShortListViewController.h"

@interface YVDisplayShortListViewControllerTests : XCTestCase
@property (strong, nonatomic) YVDisplayShortListViewController *controller;
@property (strong, nonatomic) id mockAdapter;
@property (strong, nonatomic) id mockTableView;
@property (strong, nonatomic) id mockPresenter;
@end

@implementation YVDisplayShortListViewControllerTests

- (void)setUp
{
    [super setUp];
    self.controller = [YVDisplayShortListViewController new];
    
    self.mockPresenter = OCMProtocolMock(@protocol(YVDisplayShortListViewOutput));
    self.mockAdapter = OCMClassMock([YVDisplayShortListAdapter class]);
    self.mockTableView = OCMClassMock([UITableView class]);

    self.controller.shortListAdapter = self.mockAdapter;
    self.controller.shortListTableView = self.mockTableView;
    self.controller.presenter = self.mockPresenter;
    
}

- (void)tearDown
{
    self.controller = nil;
    [self.mockPresenter stopMocking];
    self.mockPresenter = nil;
    [self.mockAdapter stopMocking];
    self.mockAdapter = nil;
    [self.mockTableView stopMocking];
    self.mockTableView = nil;
    [super tearDown];
}

- (void)testUpdateModels
{
    [self.controller updateViewWithModels:OCMOCK_ANY error:OCMOCK_ANY];
    OCMVerify([self.mockTableView reloadData]);
}

@end
