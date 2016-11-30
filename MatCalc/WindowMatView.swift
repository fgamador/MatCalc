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

        let scaling = min(bounds.width / CGFloat(mat.pictureWidth!),
                          bounds.height / CGFloat(mat.pictureHeight!))

        let matRectWidth = scaling*CGFloat(mat.pictureWidth!)
        let matRectHeight = scaling*CGFloat(mat.pictureHeight!)
        let matRect = CGRect(x: (bounds.width - matRectWidth) / 2,
                             y: (bounds.height - matRectHeight) / 2,
                             width: matRectWidth,
                             height: matRectHeight)

        UIColor.black.set()
        UIBezierPath(rect: matRect).stroke()
    }
}
