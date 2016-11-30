//
//  MatBoardView.swift
//  MatCalc
//
//  Created by Franz Amador on 11/28/16.
//  Copyright © 2016 Franz Amador. All rights reserved.
//

import UIKit

class WindowMatView: UIView {

    // MARK: Properties

    var mat: WindowMat!

    // MARK: Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }

    override func draw(_ bounds: CGRect) {
        if !mat.hasAllValues() {
            return
        }

        let scaling = min(bounds.width / CGFloat(mat.matWidth!),
                          bounds.height / CGFloat(mat.matHeight!))

        let matRectWidth = scaling*CGFloat(mat.matWidth!)
        let matRectHeight = scaling*CGFloat(mat.matHeight!)
        let matRectX = (bounds.width - matRectWidth) / 2
        let matRectY = (bounds.height - matRectHeight) / 2
        let matRect = CGRect(x: matRectX, y: matRectY, width: matRectWidth, height: matRectHeight)

        let pictureRectX = matRectX + scaling*CGFloat(mat.sideBorder!)
        let pictureRectY = matRectY + scaling*CGFloat(mat.topBorder!)
        let pictureRectWidth = scaling*CGFloat(mat.pictureWidth!)
        let pictureRectHeight = scaling*CGFloat(mat.pictureHeight!)
        let pictureRect = CGRect(x: pictureRectX,
                                 y: pictureRectY,
                                 width: pictureRectWidth,
                                 height: pictureRectHeight)

        UIColor.black.set()
        UIBezierPath(rect: matRect).stroke()

        UIColor.gray.set()
        UIBezierPath(rect: pictureRect).fill()
    }
}
