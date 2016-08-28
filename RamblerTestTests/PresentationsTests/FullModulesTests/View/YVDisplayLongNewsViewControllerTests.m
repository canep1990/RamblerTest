//
//  YVDisplayLongNewsViewControllerTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "YVDisplayLongNewsViewController.h"

@interface YVDisplayLongNewsViewControllerTests : XCTestCase
@property (strong, nonatomic) YVDisplayLongNewsViewController *controller;

@property (strong, nonatomic) id <YVDisplayLongNewsViewOutput, YVDisplayLongNewsViewInput> mockPresenter;
@end

@implementation YVDisplayLongNewsViewControllerTests

- (void)setUp
{
    [super setUp];
    self.controller = [YVDisplayLongNewsViewController new];
    self.mockPresenter = OCMProtocolMock(@protocol(YVDisplayLongNewsViewOutput));
    self.controller.presenter = self.mockPresenter;
}

- (void)tearDown
{
    self.controller = nil;
    [(id)self.mockPresenter stopMocking];
    self.mockPresenter = nil;
    [super tearDown];
}

- (void)testViewDidLoad
{
    [self.controller viewDidLoad];
    OCMVerify([self.mockPresenter viewDidLoad]);
}

@end
