# FlatButton

A simple, light-weight, flat design UI button for iOS.

![FlatButton Screenshot 1][1]

## About

Following recent trends toward flat design. Get hip. Embrace minimalism.

* Simple, easy-to-use sublcass of `UIButton`
* iOS 5.0+, ARC, Universal, Retina, Storyboards
* Make flat buttons with text and/or images

Free icons designed by [Darran Morris](https://twitter.com/darranmorris) at [APP-BITS](http://app-bits.com). Go show him some love.
**See `App-Bits Icons/00_License.txt` and `App-Bits Icons/00_readme.pdf` for details on icon usage**

## Installation

* Drag the `FlatButton/` folder to your project
* Initialize buttons
	* To create buttons programmatically:
		* Call `initWithFrame: backgroundColor: foregroundColor:`
		* Or, use the [`UIButton`][2] API `buttonWithType:` with `UIButtonTypeCustom`, or `initWithFrame:`
	* To create buttons with Storyboards:
		* Drag a `UIButton` to your view
		* Set its class to `JSFlatButton` and button type to `Custom` in Interface Builder
		* Set your `IBOutlet` and `IBAction` accordingly
* Set button properties `buttonBackgroundColor` and `buttonForegroundColor`
* **Colors must be set in HSB color space**
	* Use [`UIColor`][3] API `colorWithHue: saturation: brightness: alpha:`
* Call `setFlatTitle:` and `setFlatImage:` to set the button title and image, respectively
* You may set your button title font and other attributes as you normally would with `UIButton`
* *Special Options*
	* Set `shouldHighlightImage` to `YES` to optionally highlight the button image when pressed
	* Set `shouldHighlightText` to `YES`to optionally highlight the button title text when pressed
	* To make a flat button with an *image-only* and **no** background color:
		* Set `buttonBackgroundColor` to `nil`
		* Set `shouldHighlightImage` to `YES`
		* Set your `buttonForegroundColor` to whatever you want
		* Call `setFlatTitle:` with `nil`
	* Similarly, you can make a flat button with *text-only* and **no** background color
* See included demo project: `FlatButtonDemo.xcodeproj` 

## License

You are free to use this as you please. No attribution necessary. 

**If you use this, please tell me about it!**

MIT License
Copyright &copy; 2013 Jesse Squires

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[1]:https://raw.github.com/jessesquires/FlatButton/master/Screenshots/screenshot-iphone4.png

[2]:http://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UIButton_Class/UIButton/UIButton.html
[3]:http://developer.apple.com/library/ios/#documentation/uikit/reference/UIColor_Class/Reference/Reference.html