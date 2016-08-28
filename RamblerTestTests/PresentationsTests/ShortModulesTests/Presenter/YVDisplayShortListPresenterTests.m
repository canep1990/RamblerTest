//
//  YVDisplayShortListPresenterTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "YVDisplayShortListPresenter.h"

@interface YVDisplayShortListPresenterTests : XCTestCase
@property (strong, nonatomic) YVDisplayShortListPresenter *presenter;

@property (strong, nonatomic) id mockView;
@property (strong, nonatomic) id mockInteractor;
@property (strong, nonatomic) id mockRouter;

@end

@implementation YVDisplayShortListPresenterTests

- (void)setUp
{
    [super setUp];
    self.presenter = [YVDisplayShortListPresenter new];
    
    self.mockView = OCMProtocolMock(@protocol(YVDisplayShortListViewInput));
    self.mockInteractor = OCMProtocolMock(@protocol(YVDisplayShortListInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(YVDisplayShortListRouterInput));
    
    self.presenter.view = self.mockView;
    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
}

- (void)tearDown
{
    self.presenter = nil;
    [self.mockView stopMocking];
    self.mockView = nil;
    [self.mockInteractor stopMocking];
    self.mockInteractor = nil;
    [self.mockRouter stopMocking];
    self.mockRouter = nil;
    [super tearDown];
}

- (void)testPresenterToHandleLoadNews
{
    OCMStub([self.mockInteractor getFilteredNewsWithCompletion:^(NSArray<YVNewsModel *> * _Nullable models, NSError * _Nullable error)
    {
        OCMVerify([self.mockView updateViewWithModels:OCMOCK_ANY error:OCMOCK_ANY]);
    }]);
}

- (void)testDidSelectNewsModelCalled
{
    [self.presenter didSelectNewsModel:OCMOCK_ANY];
    OCMVerify([self.mockRouter presentLongNewsModuleForSelectedNews:OCMOCK_ANY]);
}

@end
