// GifMagic Mac Playground

import Cocoa
@testable import GifMagic

let images: [NSImage] = Array(0..<22)
  .map({
    let url = URL(fileURLWithPath: NSHomeDirectory(), relativeTo: nil)
      .appendingPathComponent("Downloads")
      .appendingPathComponent("badge4-\($0)@2x")
      .appendingPathExtension("png")

    return url
  })
  .flatMap({
    return NSImage(contentsOf: $0)
  })

let fileUrl = Encoder().encode(images: images, frameDuration: 0.05)
print(fileUrl)
