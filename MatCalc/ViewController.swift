//
//  ViewController.swift
//  MatCalc
//
//  Created by Franz Amador on 11/13/16.
//  Copyright © 2016 Franz Amador. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

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

        pictureWidthField.delegate = self
        pictureHeightField.delegate = self
        matWidthField.delegate = self
        matHeightField.delegate = self
        overlapField.delegate = self
        weightField.delegate = self

        overlapField.text = "0"
        overlap = 0;
        weightField.text = "0"
        weight = 0;
    }

    // MARK: Actions

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    @IBAction func pictureWidthEditingDidEnd(_ sender: UITextField) {
        pictureWidth = fieldToDouble(field: pictureWidthField)
        tryToShowBorderSides()
    }

    @IBAction func pictureHeightEditingDidEnd(_ sender: UITextField) {
        pictureHeight = fieldToDouble(field: pictureHeightField)
        tryToShowBorderTopAndBottom()
    }

    @IBAction func matWidthEditingDidEnd(_ sender: UITextField) {
        matWidth = fieldToDouble(field: matWidthField)
        tryToShowBorderSides()
    }

    @IBAction func matHeightEditingDidEnd(_ sender: UITextField) {
        matHeight = fieldToDouble(field: matHeightField)
        tryToShowBorderTopAndBottom()
    }

    @IBAction func overlapEditingDidEnd(_ sender: UITextField) {
        overlap = fieldToDouble(field: overlapField)
        tryToShowBorderSides()
        tryToShowBorderTopAndBottom()
    }

    @IBAction func weightEditingDidEnd(_ sender: UITextField) {
        weight = fieldToDouble(field: weightField)
        tryToShowBorderTopAndBottom()
    }

    // MARK: Methods
    
    func tryToShowBorderSides() {
        let border = tryToCalculateBorderSides()
        if (border != nil) {
            leftBorderLabel.text = String(border!)
            rightBorderLabel.text = String(border!)
        }
    }
    
    func tryToCalculateBorderSides() -> Double? {
        if pictureWidth == nil || matWidth == nil || overlap == nil {
            return nil
        }
        
        let effectivePictureWidth = pictureWidth! - 2*overlap!;
        return (matWidth! - effectivePictureWidth) / 2
    }
    
    func tryToShowBorderTopAndBottom() {
        let borders = tryToCalculateBorderTopAndBottom()
        if (borders.top != nil && borders.bottom != nil) {
            topBorderLabel.text = String(borders.top!)
            bottomBorderLabel.text = String(borders.bottom!)
        }
    }

    func tryToCalculateBorderTopAndBottom() -> (top: Double?, bottom: Double?) {
        if pictureHeight == nil || matHeight == nil || overlap == nil || weight == nil {
            return (nil, nil)
        }
        
        let effectivePictureHeight = pictureHeight! - 2*overlap!;
        let border = (matHeight! - effectivePictureHeight) / 2
        return (border - weight!, border + weight!)
    }

    func fieldToDouble(field: UITextField) -> Double? {
        if field.text == nil {
            return nil
        }
        
        return Double(field.text!)
    }
}
