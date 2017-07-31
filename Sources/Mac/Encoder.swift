import ImageIO
import Cocoa
import CoreGraphics

public class Encoder {
  public func encode(images: [NSImage], frameDuration: TimeInterval) -> URL? {
    guard let destination = CGImageDestinationCreateWithURL(outputUrl().toCF(),
                                                      kUTTypeGIF,
                                                      images.count,
                                                      nil) else {
      return nil
    }

    CGImageDestinationSetProperties(destination, fileProperties().toCF())

    images.forEach { image in

    }

    return nil
  }

  // MARK: - Helper

  func outputUrl() -> URL {
    let temp = URL(fileURLWithPath: NSTemporaryDirectory())
      .appendingPathComponent(UUID().uuidString)
      .appendingPathExtension("gif")

    return temp
  }

  func fileProperties() -> JSONDictionary {
    return [
      kCGImagePropertyGIFDictionary as String: [
        kCGImagePropertyGIFLoopCount as String: 0
      ]
    ]
  }
}
