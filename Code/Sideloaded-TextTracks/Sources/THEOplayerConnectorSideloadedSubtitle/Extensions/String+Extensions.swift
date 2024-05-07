//
//  StringExtensions.swift
//  THEOplayer_iOS_SDK
//
//  Copyright © 2023 THEOplayer. All rights reserved.
//

import Foundation

extension String {
    
    func split(regex pattern: String) -> [String] {
        guard let re = try? NSRegularExpression(pattern: pattern, options: []) else { return [] }
        let nsString = self as NSString // needed for range compatibility
        let stop = "<SomeStringThatYouDoNotExpectToOccurInSelf>"
        let modifiedString = re.stringByReplacingMatches(
            in: self,
            options: [],
            range: NSRange(location: 0, length: nsString.length),
            withTemplate: stop)
        return modifiedString.components(separatedBy: stop)
    }
    
    func replaceFirst(of pattern: String, with replacement: String) -> String {
        if let range = self.range(of: pattern) {
            return self.replacingCharacters(in: range, with: replacement)
        } else {
            return self
        }
    }
    
    func byConcatenatingScheme(scheme: URLScheme) -> String {
        return scheme.urlScheme + self
    }
    
    func byRemovingScheme(scheme: URLScheme) -> String? {
        return self.replaceFirst(of: scheme.urlScheme, with: String())
    }

    func firstMatch(pattern: String) -> NSTextCheckingResult? {
        guard let regex: NSRegularExpression = try? NSRegularExpression(pattern: pattern, options: []) else {
            return nil
        }
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
    }

    func substring(with range: NSRange) -> String? {
        guard let swiftRange: Range = .init(range, in: self) else {
            return nil
        }
        return String(self[swiftRange])
    }

    var withoutCarriageReturns: String {
        return self.replacingOccurrences(of: "\r\n", with: "\n")
    }
}

