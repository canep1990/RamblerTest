//
//  YVDisplayLongNewsRouterTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "YVDisplayLongNewsRouter.h"

@interface YVDisplayLongNewsRouterTests : XCTestCase
@property (strong, nonatomic) id <YVDisplayLongNewsRouterInput> router;
@end

@implementation YVDisplayLongNewsRouterTests

- (void)setUp {
    [super setUp];
    self.router = [YVDisplayLongNewsRouter new];
}

- (void)tearDown {
    self.router = nil;
    [super tearDown];
}

- (void)testViewControllerWillShow
{
    UIViewController *mockController = OCMClassMock([UIViewController class]);
    [self.router presentArticleDetailsInterfaceFromViewController:mockController];
    OCMVerify([mockController.navigationController presentViewController:OCMOCK_ANY animated:OCMOCK_ANY completion:OCMOCK_ANY]);
    [(id)mockController stopMocking];
    mockController = nil;
}

@end
