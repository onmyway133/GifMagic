import Cocoa

public struct GifInfo {
  public let colorModel: String
  public let depth: Int
  public let hasAlpha: Bool?
  public let pixelWidth: Int
  public let pixelHeight: Int
  public let frameDuration: TimeInterval
  public var images = [NSImage]()

  init(colorModel: String,
       depth: Int,
       hasAlpha: Bool?,
       pixelWidth: Int,
       pixelHeight: Int,
       frameDuration: TimeInterval) {
    self.colorModel = colorModel
    self.depth = depth
    self.hasAlpha = hasAlpha
    self.pixelWidth = pixelWidth
    self.pixelHeight = pixelHeight
    self.frameDuration = frameDuration
  }
}

public struct VideoInfo {
  public var images = [NSImage]()
}
