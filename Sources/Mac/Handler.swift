import ImageIO
import Cocoa
import CoreGraphics

public class Handler {
  public let encoder: Encoder
  public let decoder: Decoder

  public init(encoder: Encoder, decoder: Decoder) {
    self.encoder = encoder
    self.decoder = decoder
  }

  /// Modify each frame in the gif
  public func modify(fileUrl: URL, closure: (NSImage) -> NSImage ) -> URL? {
    guard let result = decoder.decode(fileUrl: fileUrl) else {
      return nil
    }

    let images = result.images.map(closure)

    return encoder.encode(images: images, frameDuration: result.gifInfo.frameDuration)
  }
}
