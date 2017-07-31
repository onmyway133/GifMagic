import Cocoa
import ImageIO
import CoreGraphics

extension NSImage {
  func toCG() -> CGImage? {
    var rect = CGRect(origin: .zero, size: size)
    return cgImage(forProposedRect: &rect, context: nil, hints: nil)
  }
}
