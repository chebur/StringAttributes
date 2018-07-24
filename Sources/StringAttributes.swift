//
//  StringAttributes.swift
//  StringAttributes
//
//  Created by Dmitry Nesterenko on 05/09/2017.
//  Copyright © 2017 chebur. All rights reserved.
//

import UIKit

public typealias StringAttributes = [NSAttributedStringKey: Any]

extension Dictionary where Key == NSAttributedStringKey, Value == Any {
    
    public init(_ builder: (inout StringAttributes) -> Void) {
        self.init()
        builder(&self)
    }
    
    public var font: UIFont? {
        get {
            return self[NSAttributedStringKey.font] as? UIFont
        }
        set {
            self[NSAttributedStringKey.font] = newValue
        }
    }
    
    public var paragraphStyle: NSParagraphStyle? {
        get {
            return self[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle
        }
        set {
            self[NSAttributedStringKey.paragraphStyle] = newValue
        }
    }
    
    public var foregroundColor: UIColor? {
        get {
            return self[NSAttributedStringKey.foregroundColor] as? UIColor
        }
        set {
            self[NSAttributedStringKey.foregroundColor] = newValue
        }
    }
    
    public var backgroundColor: UIColor? {
        get {
            return self[NSAttributedStringKey.backgroundColor] as? UIColor
        }
        set {
            self[NSAttributedStringKey.backgroundColor] = newValue
        }
    }
    
    public var kern: CGFloat? {
        get {
            return self[NSAttributedStringKey.kern] as? CGFloat
        }
        set {
            self[NSAttributedStringKey.kern] = newValue
        }
    }
    
    public var underlineStyle: NSUnderlineStyle? {
        get {
            if let rawValue = self[NSAttributedStringKey.underlineStyle] as? Int {
                return NSUnderlineStyle(rawValue: rawValue)
            } else {
                return nil
            }
        }
        set {
            self[NSAttributedStringKey.underlineStyle] = newValue?.rawValue
        }
    }
    
    public var textEffect: NSAttributedString.TextEffectStyle? {
        get {
            if let string = self[NSAttributedStringKey.textEffect] as? String {
                return NSAttributedString.TextEffectStyle(rawValue: string)
            } else {
                return nil
            }
        }
        set {
            self[NSAttributedStringKey.textEffect] = newValue?.rawValue
        }
        
    }
    
    public var link: URL? {
        get {
            return self[NSAttributedStringKey.link] as? URL
        }
        set {
            self[NSAttributedStringKey.link] = newValue
        }
    }
    
    public var underlineColor: UIColor? {
        get {
            return self[NSAttributedStringKey.underlineColor] as? UIColor
        }
        set {
            self[NSAttributedStringKey.underlineColor] = newValue
        }
    }
    
    public var alignment: NSTextAlignment? {
        get {
            return paragraphStyle?.alignment
        }
        set {
            paragraphStyle = (self.paragraphStyle ?? NSParagraphStyle()).with {
                $0.alignment = newValue ?? .natural
            }
        }
    }

    public var lineSpacing: CGFloat? {
        get {
            return paragraphStyle?.lineSpacing
        }
        set {
            paragraphStyle = (self.paragraphStyle ?? NSParagraphStyle()).with {
                $0.lineSpacing = newValue ?? 0
            }
        }
    }
    
    public var paragraphSpacing: CGFloat? {
        get {
            return paragraphStyle?.paragraphSpacing
        }
        set {
            paragraphStyle = (self.paragraphStyle ?? NSParagraphStyle()).with {
                $0.paragraphSpacing = newValue ?? 0
            }
        }
    }
    
    public func asDictionary() -> [String: Any] {
        return reduce(into: [String: Any]()) { $0[$1.key.rawValue] = $1.value }
    }
    
}
