//
//  Exif.swift
//  Exif
//
//  Created by Kazunori Kikuchi on 2017/01/08.
//  Copyright © 2017年 kazunori kikuchi. All rights reserved.
//

#if canImport(UIKit)
fileprivate let keys = NSArray(contentsOfFile: Bundle(identifier: "com.kichikuchi.Exif")!.path(forResource: "ExifKeys", ofType: "plist")!) as! Array<String>

public struct Exif {
    
    public let properties: [(key: String, value: String)]
    
    public let pixelWidth: Int?
    public let pixelHeight: Int?
    public let area: [Int]?
    public let lensMaker: String?
    public let lensModel: String?
    public let lensSpecification: [Double]?
    public let focalIn35mmFilm: Int?
    public let colorSpace: Int?
    public let whiteBalance: Int?
    public let brightness: Double?
    public let aperture: Double?
    public let shutterSpeed: Double?
    public let isoSpeed: [Int]?
    public let sensingMethod: Int?
    public let focalLength: Double?
    public let fNumber: Double?
    public let exposureProgram: Int?
    public let exposureMode: Int?
    public let exposureBias: Double?
    public let exposureTime: Double?
    public let meteringMode: Int?
    public let flash: Int?
    public let flashVersion: [Int]?
    public let dateTimeOriginal: Date?
    public let dateTimeDigitized: Date?
    public let subsecondTimeOriginal: Int?
    public let subsecondTimeDigitized: Int?
    public let sceneType: Int?
    public let sceneCaptureType: Int?
    public let componentsConfiguration: [Int]?
    public let version: [Int]?
    
    public init?(forResource name: String, ofType type: String, bundle: Bundle = Bundle.main) {
        let path = bundle.path(forResource: name, ofType: type)
        assert(path != nil, "please enter correct resource name and type")
        
        let url = URL(fileURLWithPath: path!)
        self.init(contentsOf: url)
    }
    
    public init?(contentsOf url: URL) {
        if let ciimage = CIImage(contentsOf: url) {
            self.init(ciimage: ciimage)
        } else {
            return nil
        }
    }
    
    public init(ciimage: CIImage) {
        let dictionary = ciimage.properties["{Exif}"] as? Dictionary<String, Any>
        self.init(dictionary: dictionary)
    }
    
    public init(dictionary: Dictionary<String, Any>?) {
        // set properties array
        var tmpProperties: [(key: String, value: String)] = []
        
        for key in keys {
            if let values = dictionary?[key] as? Array<Any> {
                tmpProperties.append((key, values.description))
            } else if let value = dictionary?[key] {
                tmpProperties.append((key, "\(value)"))
            } else {
                tmpProperties.append((key, "-"))
            }
        }
        
        properties = tmpProperties
        
        // set each property
        pixelWidth = Int(properties[0].value)
        pixelHeight = Int(properties[1].value)
        area = properties[2].value.stringArray()?.compactMap{Int($0)}
        lensMaker = properties[3].value.isNotHyphen()
        lensModel = properties[4].value.isNotHyphen()
        lensSpecification = properties[5].value.stringArray()?.compactMap{Double($0)}
        focalIn35mmFilm = Int(properties[6].value)
        colorSpace = Int(properties[7].value)
        whiteBalance = Int(properties[8].value)
        brightness = Double(properties[9].value)
        aperture = Double(properties[10].value)
        shutterSpeed = Double(properties[11].value)
        isoSpeed = properties[12].value.stringArray()?.compactMap{Int($0)}
        sensingMethod = Int(properties[13].value)
        focalLength = Double(properties[14].value)
        fNumber = Double(properties[15].value)
        exposureProgram = Int(properties[16].value)
        exposureMode = Int(properties[17].value)
        exposureBias = Double(properties[18].value)
        exposureTime = Double(properties[19].value)
        meteringMode = Int(properties[20].value)
        flash = Int(properties[21].value)
        flashVersion = properties[22].value.stringArray()?.compactMap{Int($0)}
        dateTimeOriginal = properties[23].value.isNotHyphen()?.dateFromString()
        dateTimeDigitized = properties[24].value.isNotHyphen()?.dateFromString()
        subsecondTimeOriginal = Int(properties[25].value)
        subsecondTimeDigitized = Int(properties[26].value)
        sceneType = Int(properties[27].value)
        sceneCaptureType = Int(properties[28].value)
        componentsConfiguration = properties[29].value.stringArray()?.compactMap{Int($0)}
        version = properties[30].value.stringArray()?.compactMap{Int($0)}
    }
}

extension Exif: CustomStringConvertible {
    public var description: String {
        var description = "\n"
        
        for property in properties {
            description.append("\(property.key): \(property.value)\n")
        }
        
        return description
    }
}
#endif
