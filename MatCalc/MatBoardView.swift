//
//  MatBoardView.swift
//  MatCalc
//
//  Created by Franz Amador on 11/28/16.
//  Copyright © 2016 Franz Amador. All rights reserved.
//

import UIKit

class MatBoardView: UIView {
    // MARK: Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public var intrinsicContentSize: CGSize {
        return CGSize(width: 240, height: 128)
    }

    override func draw(_ rect: CGRect) {
        let h = rect.height
        let w = rect.width
        let color = UIColor.black

        let drect = CGRect(x: (w * 0.25), y: (h * 0.25), width: (w * 0.5), height: (h * 0.5))
        let bpath = UIBezierPath(rect: drect)

        color.set()
        bpath.stroke()
    }
}
