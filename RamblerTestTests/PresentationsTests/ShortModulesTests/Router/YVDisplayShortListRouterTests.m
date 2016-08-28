//
//  YVDisplayShortListRouterTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "YVDisplayShortListRouter.h"

@interface YVDisplayShortListRouterTests : XCTestCase
@property (strong, nonatomic) YVDisplayShortListRouter *router;
@property (strong, nonatomic) id mockDetailsRouter;
@end

@implementation YVDisplayShortListRouterTests

- (void)setUp
{
    [super setUp];
    self.router = [YVDisplayShortListRouter new];
    self.mockDetailsRouter = OCMProtocolMock(@protocol(YVDisplayLongNewsRouterInput));
    self.router.detailsRouter = self.mockDetailsRouter;
}

- (void)tearDown
{
    self.router = nil;
    [self.mockDetailsRouter stopMocking];
    self.mockDetailsRouter = nil;
    [super tearDown];
}

- (void)testNewRouterCalled
{
    [self.router presentLongNewsModuleForSelectedNews:OCMOCK_ANY];
    OCMVerify([self.mockDetailsRouter presentArticleDetailsInterfaceFromViewController:OCMOCK_ANY]);
}

@end
