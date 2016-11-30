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

    @IBOutlet weak var matView: WindowMatView!

    let mat = WindowMat()

    override func viewDidLoad() {
        super.viewDidLoad()

        pictureWidthField.delegate = self
        pictureHeightField.delegate = self
        matWidthField.delegate = self
        matHeightField.delegate = self
        overlapField.delegate = self
        weightField.delegate = self

        overlapField.text = "0"
        weightField.text = "0"

        matView.mat = mat
    }

    // MARK: Actions

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    @IBAction func pictureWidthEditingDidEnd(_ sender: UITextField) {
        mat.pictureWidth = fieldToDouble(field: pictureWidthField)
        tryToShowBorderSides()
        matView.setNeedsDisplay()
    }

    @IBAction func pictureHeightEditingDidEnd(_ sender: UITextField) {
        mat.pictureHeight = fieldToDouble(field: pictureHeightField)
        tryToShowBorderTopAndBottom()
        matView.setNeedsDisplay()
    }

    @IBAction func matWidthEditingDidEnd(_ sender: UITextField) {
        mat.matWidth = fieldToDouble(field: matWidthField)
        tryToShowBorderSides()
        matView.setNeedsDisplay()
    }

    @IBAction func matHeightEditingDidEnd(_ sender: UITextField) {
        mat.matHeight = fieldToDouble(field: matHeightField)
        tryToShowBorderTopAndBottom()
        matView.setNeedsDisplay()
    }

    @IBAction func overlapEditingDidEnd(_ sender: UITextField) {
        mat.overlap = fieldToDouble(field: overlapField)!
        tryToShowBorderSides()
        tryToShowBorderTopAndBottom()
        matView.setNeedsDisplay()
    }

    @IBAction func weightEditingDidEnd(_ sender: UITextField) {
        mat.weight = fieldToDouble(field: weightField)!
        tryToShowBorderTopAndBottom()
        matView.setNeedsDisplay()
    }

    // MARK: Methods
    
    func tryToShowBorderSides() {
        let sideBorder = mat.sideBorder
        if (sideBorder != nil) {
            leftBorderLabel.text = String(sideBorder!)
            rightBorderLabel.text = String(sideBorder!)
        }
    }

    func tryToShowBorderTopAndBottom() {
        let topBorder = mat.topBorder
        let bottomBorder = mat.bottomBorder
        if (topBorder != nil && bottomBorder != nil) {
            topBorderLabel.text = String(topBorder!)
            bottomBorderLabel.text = String(bottomBorder!)
        }
    }

    func fieldToDouble(field: UITextField) -> Double? {
        return (field.text != nil) ? Double(field.text!) : nil
    }
}
