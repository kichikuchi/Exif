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
        guard self.characters.count > 2 else {
            return nil
        }
        
        let parenthesesDeletedText = self.substring(with: self.index(self.startIndex, offsetBy: 1)..<self.index(self.endIndex, offsetBy: -1))
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
