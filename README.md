# JSQFlatButton [![Build Status](https://secure.travis-ci.org/jessesquires/JSQFlatButton.png)](http://travis-ci.org/jessesquires/JSQFlatButton) [![Version Status](https://cocoapod-badges.herokuapp.com/v/JSQFlatButton/badge.png)][docsLink] [![license MIT](http://b.repl.ca/v1/license-MIT-blue.png)][mitLink]

A light-weight, flat design [UIButton](https://developer.apple.com/library/ios/documentation/uikit/reference/UIButton_Class/UIButton/UIButton.html) for iOS.

![JSQFlatButton Screenshot][imgLink]

## Features

* Custom normal, highlighted, and disabled background colors
* Custom normal, highlighted, and disabled foreground colors
* Custom normal, highlighted, and disabled border colors
* Corner radius
* Masks images on iOS 6

## Requirements

* iOS 6.0+ 
* ARC

## Installation

#### From [CocoaPods](http://www.cocoapods.org)

`pod 'JSQFlatButton'`

#### From source

* Drag the `JSQFlatButton/` folder to your project
* Add the `QuartzCore.framework` to your project

#### Too cool for [ARC](https://developer.apple.com/library/mac/releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html)?

* Add the `-fobjc-arc` compiler flag to all source files in your project in Target Settings > Build Phases > Compile Sources.

## Getting Started

See the included demo project: `FlatButtonDemo.xcodeproj`

## Documentation

Documentation is [available here][docsLink] via [CocoaDocs](http://cocoadocs.org). Thanks [@CocoaDocs](https://twitter.com/CocoaDocs)!

## Donate

Support the developement of this **free**, open-source control! via [Square Cash](https://square.com/cash).

<h4><a href="mailto:jesse.squires.developer@gmail.com?cc=cash@square.com&subject=$1&body=Thanks for developing JSQFlatButton!">Send $1</a> <em>Just saying thanks!</em></h4>
<h4><a href="mailto:jesse.squires.developer@gmail.com?cc=cash@square.com&subject=$5&body=Thanks for developing JSQFlatButton!">Send $5</a> <em>This control is great!</em></h4>
<h4><a href="mailto:jesse.squires.developer@gmail.com?cc=cash@square.com&subject=$10&body=Thanks for developing JSQFlatButton!">Send $10</a> <em>This totally saved me time!</em></h4>

## How To Contribute

1. [Find an issue](https://github.com/jessesquires/JSQFlatButton/issues?sort=created&state=open) to work on, or create a new one
2. Fork me
3. Create a new branch with a sweet fucking name: `git checkout -b issue_<##>_<featureOrFix>`
4. Do some motherfucking programming
5. Write [unit tests](http://nshipster.com/unit-testing), if possible
6. Keep your code nice and clean by adhering to the following standards: 
    * Google's [Objective-C Style Guide](http://google-styleguide.googlecode.com/svn/trunk/objcguide.xml)
    * Apple's [Coding Guidelines for Cocoa](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html)
7. Don't break shit, like unit tests
8. Update the documentation header comments, if needed
9. Merge the latest from `develop` and **resolve any conflicts** (*before submitting a pull request!*)
10. Submit a pull request to the `develop` **[branch](https://github.com/jessesquires/JSQFlatButton/tree/develop)**

## Credits

Created by [@jesse_squires](https://twitter.com/jesse_squires), a [programming-motherfucker](http://programming-motherfucker.com).

Many thanks to [the contributors](https://github.com/jessesquires/JSQFlatButton/graphs/contributors) of this project.

Demo icons designed by [@darranmorris](https://twitter.com/darranmorris) at [APP-BITS](http://app-bits.com). *Go show him some [love](http://store.app-bits.com).*

*See [App-Bits License](https://raw.github.com/jessesquires/JSQFlatButton/master/appbits_license.txt) and [App-Bits README](https://raw.github.com/jessesquires/JSQFlatButton/master/appbits_readme.pdf) for details on icon usage.*

## Apps Using This Control

[Eight-Twelve](https://itunes.apple.com/us/app/eight-twelve/id648715570?mt=8)

*[Contact me](mailto:jesse.squires.developer@gmail.com) to have your app listed here.*

## [MIT License][mitLink]

You are free to use this as you please. **No attribution necessary, but much appreciated.**

Copyright &copy; 2013 Jesse Squires

>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[docsLink]:http://cocoadocs.org/docsets/JSQFlatButton/2.0.0
[mitLink]:http://opensource.org/licenses/MIT
[imgLink]:https://raw.github.com/jessesquires/JSQFlatButton/master/Screenshots/screenshot.png

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/jessesquires/jsqflatbutton/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
