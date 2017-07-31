import Foundation

typealias JSONDictionary = [String: Any]

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
