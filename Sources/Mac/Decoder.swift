import ImageIO
import Cocoa
import CoreGraphics

public class Decoder {
  public init() {

  }
}

public extension Decoder {
  /// Decode gif file to multile images
  public func decode(gifUrl: URL) -> GifInfo? {
    guard let source = CGImageSourceCreateWithURL(gifUrl.toCF(), nil) else {
      return nil
    }

    let frameCount = CGImageSourceGetCount(source)
    let images: [NSImage] = Array(0..<frameCount).flatMap({
      guard let cgImage = CGImageSourceCreateImageAtIndex(source, $0, nil) else {
        return nil
      }

      return NSImage(cgImage: cgImage, size: .zero)
    })

    guard var gifInfo = getInfo(source: source) else {
      return nil
    }

    gifInfo.images = images
    return gifInfo
  }

  // MARK: - Helper

  func getInfo(source: CGImageSource) -> GifInfo? {
    guard let dictionary: JSONDictionary =
      CGImageSourceCopyPropertiesAtIndex(source, 0, nil)?.toDictionary()
      else {
        return nil
    }

    guard let colorModel = dictionary[kCGImagePropertyColorModel as String] as? String,
      let depth = dictionary[kCGImagePropertyDepth as String] as? Int,
      let pixelHeight = dictionary[kCGImagePropertyPixelHeight as String] as? Int,
      let pixelWidth = dictionary[kCGImagePropertyPixelWidth as String] as? Int,
      let gif = dictionary[kCGImagePropertyGIFDictionary as String] as? JSONDictionary,
      let unclampedDelayTime = gif[kCGImagePropertyGIFUnclampedDelayTime as String] as? TimeInterval else {
        return nil
    }

    let hasAlpha = dictionary[kCGImagePropertyHasAlpha as String] as? Bool

    return GifInfo(colorModel: colorModel,
                   depth: depth,
                   hasAlpha: hasAlpha,
                   pixelWidth: pixelWidth,
                   pixelHeight: pixelHeight,
                   frameDuration: unclampedDelayTime)
  }
}

public extension Decoder {
  /// Decode video file to multile images
  public func decode(videoUrl: URL) -> VideoInfo? {
    return nil
  }
}
