//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2013 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import <XCTest/XCTest.h>
#import "JSQFlatButton.h"

@interface FlatButtonDemoTests : XCTestCase

@end



@implementation FlatButtonDemoTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInit
{
    UIColor *bg = [UIColor colorWithHue:0.75f saturation:0.75f brightness:0.75f alpha:1.0f];
    UIColor *fg = [UIColor colorWithHue:0.5f saturation:0.5f brightness:0.5f alpha:1.0f];
    NSString *title = @"My Button";
    UIImage *image = [UIImage imageNamed:@"play"];
    
    JSQFlatButton *btn = [[JSQFlatButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 44.0f)
                                              backgroundColor:bg
                                              foregroundColor:fg
                                                        title:title
                                                        image:image];
    
    XCTAssertNotNil(btn, @"Button should not be nil.");
    
    XCTAssertNotNil(btn.normalBackgroundColor, @"Color should not be nil");
    XCTAssertNotNil(btn.highlightedBackgroundColor, @"Color should not be nil");
    XCTAssertNotNil(btn.disabledBackgroundColor, @"Color should not be nil");
    
    XCTAssertNotNil(btn.normalForegroundColor, @"Color should not be nil");
    XCTAssertNotNil(btn.highlightedForegroundColor, @"Color should not be nil");
    XCTAssertNotNil(btn.disabledForegroundColor, @"Color should not be nil");
    
    XCTAssertNil(btn.normalBorderColor, @"Color should not be nil");
    XCTAssertNil(btn.highlightedBorderColor, @"Color should not be nil");
    XCTAssertNil(btn.disabledBorderColor, @"Color should not be nil");
    
    XCTAssertEqual(btn.cornerRadius, 0.0f, @"Corner radius should be zero.");
    XCTAssertEqual(btn.borderWidth, 0.0f, @"Border should be zero.");
    
    XCTAssertNotNil(title, @"Title should not be nil.");
    XCTAssertEqualObjects(title, btn.titleLabel.text, @"Titles should be equal.");
    
    XCTAssertNotNil(btn.imageView.image, @"Image should not be nil.");
}

@end
