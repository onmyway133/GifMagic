import Cocoa
import ImageIO
import CoreGraphics

typealias JSONDictionary = [String: Any]

extension NSImage {
  func toCG() -> CGImage? {
    var rect = CGRect(origin: .zero, size: size)
    return cgImage(forProposedRect: &rect, context: nil, hints: nil)
  }
}

extension URL {
  func toCF() -> CFURL {
    return self as CFURL
  }
}

extension Dictionary {
  func toCF() -> CFDictionary {
    return self as CFDictionary
  }
}

extension Data {
  func toCF() -> CFData {
    return self as CFData
  }
}

extension CFDictionary {
  func toDictionary() -> Dictionary<String, Any> {
    let nsDictionary = self as NSDictionary

    var dict = [String: Any]()
    for (key, value) in nsDictionary {
      if let key = key as? String {
        dict[key] = value
      }
    }

    return dict
  }
}
