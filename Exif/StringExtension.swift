//
//  StringExtension.swift
//  Exif
//
//  Created by Kazunori Kikuchi on 2017/01/08.
//  Copyright © 2017年 kazunori kikuchi. All rights reserved.
//

import Foundation

extension String {
    func stringArray() -> [String]? {
        guard self.count > 2 else {
            return nil
        }
        
        let parenthesesDeletedText = String(self.prefix(self.count - 1)).suffix(self.count - 2)
        let separated = parenthesesDeletedText.components(separatedBy: ",")
        return separated.map{ $0.trimmingCharacters(in: .whitespaces) }
    }
    
    func isNotHyphen() -> String? {
        return self == "-" ? nil : self
    }
    
    func dateFromString() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return formatter.date(from: self)
    }
}
