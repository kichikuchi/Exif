# Exif
[![Build Status](https://travis-ci.org/kichikuchi/Exif.svg?branch=master)](https://travis-ci.org/kichikuchi/Exif)

This is a Swift framework providing Exif.

## Use

### create

```swift
// from resource, type
let exif = Exif(forResource: "cat", ofType: "jpg")

// from ciimage
let ciimage = CIImage()
let exif = Exif(ciimage: ciimage)

// from resource path
let url = URL(fileURLWithPath: pathString)
let exif = Exif(contentsOf: url)

```

### access

```swift
let exif = Exif(forResource: "cat", ofType: "jpg")

// all properties
exif.properties.forEach { (key, value) in
    print(key, value)
}

// each property
exif.aperture
exif.fNumber // exif has 31 properties

```

## Requirements

- Swift 4.1 / Xcode 9.3
- iOS 9.0 or later

## Installation

### Carthage

- Add `github "kichikuchi/Exif"` to your Cartfile.
- Run `carthage update`.

## License

Exif is released under the [MIT License](LICENSE.md).
