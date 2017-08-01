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
    .appendingPathComponent("C43F2F21-02B2-4FA4-B2CB-9839436D6399")
    .appendingPathExtension("gif")

  let result = Decoder().decode(fileUrl: url)
  print(result as Any)
}

decode()


