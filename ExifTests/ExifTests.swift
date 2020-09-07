//
//  ExifTests.swift
//  ExifTests
//
//  Created by Kazunori Kikuchi on 2019/02/09.
//  Copyright © 2019 kazunori kikuchi. All rights reserved.
//

import XCTest
@testable import Exif

class ExifTests: XCTestCase {
    func testExif() {
        guard let exif = Exif(forResource: "test", ofType: "jpg", bundle: Bundle(for: type(of: self))) else { return }
        
        XCTAssertNotNil(exif)
        XCTAssertEqual(exif.pixelWidth, 756)
        XCTAssertEqual(exif.pixelHeight, 1008)
        XCTAssertEqual(exif.area, [2015, 1511, 2217, 1330])
        XCTAssertEqual(exif.lensMaker, "Apple")
        XCTAssertEqual(exif.lensModel, "iPhone X back dual camera 4mm f/1.8")
        XCTAssertEqual(exif.lensSpecification, [4, 6, 1.8, 2.4])
        XCTAssertEqual(exif.focalIn35mmFilm, 28)
        XCTAssertEqual(exif.focalLength, 4)
        XCTAssertEqual(exif.whiteBalance, 0)
        XCTAssertEqual(exif.brightness, 7.082936129647283)
        XCTAssertEqual(exif.aperture, 1.695993715632365)
        XCTAssertEqual(exif.shutterSpeed, 7.549755301794454)
        XCTAssertEqual(exif.isoSpeed, [20])
        XCTAssertEqual(exif.sensingMethod, 2)
        XCTAssertEqual(exif.fNumber, 1.8)
        XCTAssertEqual(exif.exposureProgram, 2)
        XCTAssertEqual(exif.exposureMode, 0)
        XCTAssertEqual(exif.exposureBias, 0)
        XCTAssertEqual(exif.exposureTime, 0.0053475935828877)
        XCTAssertEqual(exif.meteringMode, 5)
        XCTAssertEqual(exif.flash, 16)
        XCTAssertEqual(exif.flashVersion, [1, 0])
        XCTAssertEqual(exif.subsecondTimeOriginal, 790)
        XCTAssertEqual(exif.subsecondTimeDigitized, 790)
        XCTAssertEqual(exif.sceneType, 1)
        XCTAssertEqual(exif.sceneCaptureType, 0)
        XCTAssertEqual(exif.componentsConfiguration, [1, 2, 3, 0])
        XCTAssertEqual(exif.version, [2, 2, 1])
        
        XCTAssertNil(exif.colorSpace)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        formatter.locale = Locale(identifier: "ja_JP")
        let date = formatter.date(from: "2017:11:12 16:21:06")
        XCTAssertEqual(exif.dateTimeOriginal, date)
        XCTAssertEqual(exif.dateTimeDigitized, date)
    }
}
