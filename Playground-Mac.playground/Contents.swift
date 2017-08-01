// GifMagic Mac Playground

import Cocoa
@testable import GifMagic

func encode() {
  let images: [NSImage] = Array(0..<22)
    .map({
      let url = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Downloads")
        .appendingPathComponent("badge4-\($0)@2x")
        .appendingPathExtension("png")

      return url
    })
    .flatMap({
      return NSImage(contentsOf: $0)
    })

  let fileUrl = Encoder().encode(images: images, frameDuration: 0.05)
  print(fileUrl as Any)
}

func decode() {
  let url = URL(fileURLWithPath: NSHomeDirectory())
    .appendingPathComponent("Downloads")
    .appendingPathComponent("41F54DB9-391E-4EAB-9E6C-17FE21683D5D")
    .appendingPathExtension("gif")

  let result = Decoder().decode(fileUrl: url)
  print(result as Any)
}

func modify() {
  let url = URL(fileURLWithPath: NSHomeDirectory())
    .appendingPathComponent("Downloads")
    .appendingPathComponent("5C97AFD3-54C3-4FE2-940F-EFB01BA066DE")
    .appendingPathExtension("gif")

  let fileUrl = Handler().modify(fileUrl: url, closure: { image in
    return image
  })

  print(fileUrl as Any)
}

modify()


