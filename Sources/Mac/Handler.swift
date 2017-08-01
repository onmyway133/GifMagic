import ImageIO
import Cocoa
import CoreGraphics

public class Handler {
  /// Modify each frame in the gif
  public func modify(fileUrl: URL, closure: (NSImage) -> NSImage ) -> URL? {
    guard let result = Decoder().decode(fileUrl: fileUrl) else {
      return nil
    }

    let images = result.images.map(closure)

    return Encoder().encode(images: images, frameDuration: result.gifInfo.frameDuration)
  }
}
