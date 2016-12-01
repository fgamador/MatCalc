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
        let matRect = calcMatRect(scaling: scaling)
        let pictureRect = calcPictureRect(matRectOrigin: matRect.origin, scaling: scaling)

        UIColor.black.set()
        UIBezierPath(rect: matRect).stroke()

        UIColor.gray.set()
        UIBezierPath(rect: pictureRect).fill()
    }

    func calcMatRect(scaling: CGFloat) -> CGRect {
        let matRectWidth = scaling*CGFloat(mat.matWidth!)
        let matRectHeight = scaling*CGFloat(mat.matHeight!)
        return CGRect(x: (bounds.width - matRectWidth) / 2,
                      y: (bounds.height - matRectHeight) / 2,
                      width: matRectWidth, height: matRectHeight)
    }

    func calcPictureRect(matRectOrigin: CGPoint, scaling: CGFloat) -> CGRect {
        return CGRect(x: matRectOrigin.x + scaling*CGFloat(mat.sideBorder!),
                      y: matRectOrigin.y + scaling*CGFloat(mat.topBorder!),
                      width: scaling*CGFloat(mat.pictureWidth!),
                      height: scaling*CGFloat(mat.pictureHeight!))
    }
}
