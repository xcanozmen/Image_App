//
//  Formatters.swift
//  Image_App
//
//  Created by Can on 10.03.2021.
//

import Foundation

public struct Units {
    
    public let bytes: Int
    
    public var kilobytes: Double {
        return Double(bytes) / 1024
    }
    
    public var megabytes: Double {
        return kilobytes / 1024
    }
    
    public init(bytes: Int) {
        self.bytes = bytes
    }
    
    public func getStringFromUnits() -> String {
        
        switch bytes {
        case 0..<1024:
            return "\(bytes) bytes"
        case 1024..<(1024 * 1024):
            return "\(String(format: "%.2f", kilobytes)) kb"
        case 1024..<(1024 * 1024 * 1024):
            return "\(String(format: "%.2f", megabytes)) mb"
        default:
            return "\(bytes) bytes"
        }
    }
}

public func getStringFromDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .medium
    formatter.dateStyle = .long
    return formatter.string(from: date)
}
