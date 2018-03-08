# About Single-hand-Sticker
A sticker view, just like MeiTuXiuXiu,  which can be scaled、rotated and moved with single finger or both hands. 


## How to import into your project

Just drag this framework to your project. Enjoy it!


## How to use it

you can initial the widget in Objective-C code in this way

```objective-c

    StickerView *sticker = [[StickerView alloc] initWithContentFrame:CGRectMake(0, 0, 150, 150) contentImage:[UIImage imageNamed:@"sticker1.png"]];
    sticker.center = self.view.center;
    sticker.enabledControl = YES;
    sticker.enabledBorder = YES;
    sticker.delegate = self;
    [self.view addSubview:sticker];

```

you can control the sticker's appearance like this

```objective-c
    
    sticker.enabledControl = YES; // enable or disable the operation buttons
    sticker.enabledBorder = YES; // show or hide the border line

```

you even can custom the sticker view through the delegate

```objective-c
    
    @protocol StickerViewDelegate <NSObject>

	@optional

	- (void)stickerViewDidTapContentView:(StickerView *)stickerView;

	- (void)stickerViewDidTapDeleteControl:(StickerView *)stickerView;

	- (UIImage *)stickerView:(StickerView *)stickerView imageForRightTopControl:(CGSize)recommendedSize;

	- (void)stickerViewDidTapRightTopControl:(StickerView *)stickerView; // Effective when resource is provided.

	- (UIImage *)stickerView:(StickerView *)stickerView imageForLeftBottomControl:(CGSize)recommendedSize;

	- (void)stickerViewDidTapLeftBottomControl:(StickerView *)stickerView; // Effective when resource is provided.

	@end
    
```

## What does it look like 

<img src="https://github.com/chenkaijie4ever/Single-hand-Sticker/blob/master/ScreenShot/1.gif" width="315" />
<img src="https://github.com/chenkaijie4ever/Single-hand-Sticker/blob/master/ScreenShot/2.gif" width="315" />

## Author

Chen Kaijie  

chenkaijie4ever@gmail.com


## LICENSE

 Copyright 2016 Chen Kaijie

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.


