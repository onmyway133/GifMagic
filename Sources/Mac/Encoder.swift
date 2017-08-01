import ImageIO
import Cocoa
import CoreGraphics

public class Encoder {

  public init() {

  }

  /// Make gif from images
  public func encode(images: [NSImage], frameDuration: TimeInterval) -> URL? {
    let outputUrl = self.outputUrl()
    guard let destination = CGImageDestinationCreateWithURL(outputUrl.toCF(),
                                                      kUTTypeGIF,
                                                      images.count,
                                                      nil) else {
      return nil
    }

    CGImageDestinationSetProperties(destination, fileProperties().toCF())
    let frameProperty = self.frameProperty(duration: frameDuration)

    images.forEach { image in
      guard let cgImage = image.toCG() else {
        return
      }

      CGImageDestinationAddImage(destination, cgImage, frameProperty.toCF())
    }

    let result = CGImageDestinationFinalize(destination)
    return result ? outputUrl : nil
  }

  // MARK: - Helper

  func outputUrl() -> URL {
    let temp = URL(fileURLWithPath: NSHomeDirectory())
      .appendingPathComponent("Downloads")
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

  func frameProperty(duration: TimeInterval) -> JSONDictionary {
    return [
      kCGImagePropertyGIFDictionary as String: [
        kCGImagePropertyGIFDelayTime as String: duration,
        kCGImagePropertyColorModel as String: kCGImagePropertyColorModelRGB as String
      ]
    ]
  }
}
