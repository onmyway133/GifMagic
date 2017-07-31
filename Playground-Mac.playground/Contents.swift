// GifMagic Mac Playground

import Cocoa
import GifMagic

var str = "Hello, playground"
let images: [NSImage] = Array(0..<12)
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

let fileUrl = GifMagic.Encoder().encode(images: images, frameDuration: 0.2)
print(fileUrl)