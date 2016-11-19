//
//  ViewController.swift
//  MatCalc
//
//  Created by Franz Amador on 11/13/16.
//  Copyright © 2016 Franz Amador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties

    @IBOutlet weak var topBorderLabel: UILabel!
    @IBOutlet weak var leftBorderLabel: UILabel!
    @IBOutlet weak var rightBorderLabel: UILabel!
    @IBOutlet weak var bottomBorderLabel: UILabel!

    @IBOutlet weak var pictureWidthField: UITextField!
    @IBOutlet weak var pictureHeightField: UITextField!
    @IBOutlet weak var matWidthField: UITextField!
    @IBOutlet weak var matHeightField: UITextField!
    @IBOutlet weak var overlapField: UITextField!
    @IBOutlet weak var weightField: UITextField!

    var pictureWidth: Double?
    var pictureHeight: Double?
    var matWidth: Double?
    var matHeight: Double?
    var overlap: Double?
    var weight: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: Actions

    @IBAction func pictureWidthEditingDidEnd(_ sender: UITextField) {
        pictureWidth = fieldToDouble(field: pictureWidthField)
        tryToCalculateBorderWidth()
    }

    @IBAction func pictureHeightEditingDidEnd(_ sender: UITextField) {
        pictureHeight = fieldToDouble(field: pictureHeightField)
        tryToCalculateBorderTopAndBottom()
    }

    @IBAction func matWidthEditingDidEnd(_ sender: UITextField) {
        matWidth = fieldToDouble(field: matWidthField)
        tryToCalculateBorderWidth()
    }

    @IBAction func matHeightEditingDidEnd(_ sender: UITextField) {
        matHeight = fieldToDouble(field: matHeightField)
        tryToCalculateBorderTopAndBottom()
    }

    @IBAction func overlapEditingDidEnd(_ sender: UITextField) {
        overlap = fieldToDouble(field: overlapField)
        tryToCalculateBorderWidth()
        tryToCalculateBorderTopAndBottom()
    }

    @IBAction func weightEditingDidEnd(_ sender: UITextField) {
        weight = fieldToDouble(field: weightField)
        tryToCalculateBorderTopAndBottom()
    }

    // MARK: Methods
    
    func tryToCalculateBorderWidth() {
        if pictureWidth == nil || matWidth == nil || overlap == nil {
            return
        }
        
        let effectivePictureWidth = pictureWidth! - 2*overlap!;
        let border = (matWidth! - effectivePictureWidth) / 2
        leftBorderLabel.text = String(border)
        rightBorderLabel.text = String(border)
    }
    
    func tryToCalculateBorderTopAndBottom() {
        if pictureHeight == nil || matHeight == nil || overlap == nil || weight == nil {
            return
        }
        
        let effectivePictureHeight = pictureHeight! - 2*overlap!;
        let border = (matHeight! - effectivePictureHeight) / 2
        topBorderLabel.text = String(border - weight!)
        bottomBorderLabel.text = String(border + weight!)
    }

    func fieldToDouble(field: UITextField) -> Double? {
        if field.text == nil {
            return nil
        }
        
        return Double(field.text!)
    }
}
