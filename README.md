# GifMagic

[![CI Status](http://img.shields.io/travis/onmyway133/GifMagic.svg?style=flat)](https://travis-ci.org/onmyway133/GifMagic)
[![Version](https://img.shields.io/cocoapods/v/GifMagic.svg?style=flat)](http://cocoadocs.org/docsets/GifMagic)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/GifMagic.svg?style=flat)](http://cocoadocs.org/docsets/GifMagic)
[![Platform](https://img.shields.io/cocoapods/p/GifMagic.svg?style=flat)](http://cocoadocs.org/docsets/GifMagic)
![Swift](https://img.shields.io/badge/%20in-swift%203.0-orange.svg)

## Encoder

#### Encode images into gif file

```swift
let url = Encoder().encode(images: images, frameDuration: 0.05)
```

## Decoder

#### Decode gif file into images and get info

```swift
let info = Decoder().decode(gifUrl: url)

info.images
info.frameDuration
info.pixelWidth
info.pixelHeight
```

#### Decode video file into images and get info

```swift
let info = Decoder().decode(videoUrl: url)

info.images
```

## Modifier

#### Modify each frame within the gif

```swift
let newGifUrl = Handler().modify(gifUrl: url, closure: { image in
  // Handle image the way you want
  return image
})
```

## Installation

**GifMagic** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GifMagic'
```

**GifMagic** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "onmyway133/GifMagic"
```

**GifMagic** can also be installed manually. Just download and drop `Sources` folders in your project.

## Author

Khoa Pham, onmyway133@gmail.com

## Contributing

We would love you to contribute to **GifMagic**, check the [CONTRIBUTING](https://github.com/onmyway133/GifMagic/blob/master/CONTRIBUTING.md) file for more info.

## License

**GifMagic** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/GifMagic/blob/master/LICENSE.md) file for more info.
