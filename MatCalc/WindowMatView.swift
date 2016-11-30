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

    override func draw(_ rect: CGRect) {
        if !mat.hasAllValues() {
            return
        }

        let h = rect.height
        let w = rect.width
        let color = UIColor.black

        //let drect = CGRect(x: (w * 0.25), y: (h * 0.25), width: (w * 0.5), height: (h * 0.5))
        let drect = CGRect(x: 0, y: 0, width: w, height: h)
        let bpath = UIBezierPath(rect: drect)

        color.set()
        bpath.stroke()
    }
}
