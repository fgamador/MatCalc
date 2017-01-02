//
//  WindowMat.swift
//  MatCalc
//
//  Created by Franz Amador on 11/29/16.
//  Copyright © 2016 Franz Amador. All rights reserved.
//

import Foundation

class WindowMat {

    // MARK: Properties
    
    var pictureWidth: Double? {
        didSet {
            tryToCalculateSideBorder()
        }
    }
    var pictureHeight: Double? {
        didSet {
            tryToCalculateTopAndBottomBorders()
        }
    }
    var matWidth: Double? {
        didSet {
            tryToCalculateSideBorder()
        }
    }
    var matHeight: Double? {
        didSet {
            tryToCalculateTopAndBottomBorders()
        }
    }
    var margin: Double = 0 {
        didSet {
            tryToCalculateTopAndBottomBorders()
            tryToCalculateSideBorder()
        }
    }
    var weight: Double = 0 {
        didSet {
            tryToCalculateTopAndBottomBorders()
        }
    }

    var topBorder: Double?
    var sideBorder: Double?
    var bottomBorder: Double?

    // MARK: Methods

    func hasAllValues() -> Bool {
        return pictureWidth != nil && pictureHeight != nil && matWidth != nil && matHeight != nil
    }

    func tryToCalculateSideBorder() {
        if pictureWidth == nil || matWidth == nil {
            return
        }

        let effectivePictureWidth = pictureWidth! + 2*margin;
        sideBorder = (matWidth! - effectivePictureWidth) / 2
    }

    func tryToCalculateTopAndBottomBorders() {
        if pictureHeight == nil || matHeight == nil {
            return
        }

        let effectivePictureHeight = pictureHeight! + 2*margin;
        let border = (matHeight! - effectivePictureHeight) / 2
        topBorder = border - weight
        bottomBorder = border + weight
    }
}
