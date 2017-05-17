//
//  KinematicsViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import Material
import ChameleonFramework

let constant: CGFloat = 32


class KinematicsViewController: UIViewController {
    
    fileprivate var textField: TextField!
    fileprivate var velocityField: TextField!
    fileprivate var finalVelocityField: TextField!
    fileprivate var accelerationField: TextField!
    fileprivate var positionField: TextField!
    fileprivate var timeField: TextField!
    fileprivate var initialPositionField: TextField!
    fileprivate var finalPositionField: TextField!
    
    
    fileprivate var passwordField: TextField!
    
   
    var users = [[String: AnyObject]]()
    
    class func instantiateFromStoryboard() -> KinematicsViewController {
        let storyboard = UIStoryboard(name: "MenuViewController", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! KinematicsViewController
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCalculateButton()
        prepareInitialVelocityField()
        prepareFinalVelocityField()
        prepareAccelerationField()
        prepareTimeField()
        prepareInitialPositionField()
        prepareFinalPositionField()
        //self.view.addFullScreenBackground("blue")
        self.view.backgroundColor = UIColor.backgroundColor() //E9CFEC
    }
}

extension KinematicsViewController {
    
    /// Prepares the resign responder button.
    fileprivate func prepareCalculateButton() {
        let btn = RaisedButton(title: "Calculate", titleColor: Color.blue.base)
        btn.addTarget(self, action: #selector(handleResignResponderButton(button:)), for: .touchUpInside)
        
        view.layout(btn).width(self.view.width - 40).height(constant).top(constant * 13).right(20)
    }
    
    /// Handle the resign responder button.
    @objc
    internal func handleResignResponderButton(button: UIButton) {
        textField?.resignFirstResponder()
        passwordField?.resignFirstResponder()
        
        if velocityField.text != nil,
            let velocity = Double(velocityField.text!) {
            kinematicsDict["Initial Velocity"] = velocity
        }
        if finalVelocityField.text != nil,
            let finalVelocity = Double(finalVelocityField.text!) {
            kinematicsDict["Final Velocity"] = finalVelocity
        }
        if accelerationField.text != nil,
            let acceleration = Double(accelerationField.text!) {
            kinematicsDict["Acceleration"] = acceleration
        }
        if timeField.text != nil,
            let time = Double(timeField.text!) {
            kinematicsDict["Time"] = time
        }
        if initialPositionField.text != nil,
            let initialPosition = Double(initialPositionField.text!) {
            kinematicsDict["Initial Position"] = initialPosition
        }
        
        if finalPositionField.text != nil,
            let finalPosition = Double(finalPositionField.text!) {
            kinematicsDict["Final Position"] = finalPosition
        }
        
        var firstEqWorks = false
        var secondEqWorks = false
        var thirdEqWorks = false
        
        var firstEqCount = 0
        var secondEqCount = 0
        var thirdEqCount = 0
        
        if kinematicsDict["Initial Velocity"] != nilDouble {
            firstEqCount += 1
            secondEqCount += 1
            thirdEqCount += 1
        }
        
         if kinematicsDict["Final Velocity"] != nilDouble {
            firstEqCount += 1
            thirdEqCount += 1
        }
        
        if kinematicsDict["Acceleration"] != nilDouble {
            firstEqCount += 1
            secondEqCount += 1
            thirdEqCount += 1
        }
        
        if kinematicsDict["Time"] != nilDouble {
            firstEqCount += 1
            secondEqCount += 1
        }
        
        if kinematicsDict["Initial Position"] != nilDouble {
        
            secondEqCount += 1
            thirdEqCount += 1
        }
        if kinematicsDict["Final Position"] != nilDouble {
            
            secondEqCount += 1
            thirdEqCount += 1
        }
        
        if firstEqCount >= 3 {
            firstEqWorks = true
           // performFirstEquation(
        }
        if secondEqCount >= 4 {
            secondEqWorks = true
        }
        if thirdEqCount >= 4 {
            thirdEqWorks = true
        }
        
        
    }
    
    
    
    func performFirstEquation(a: Double, t: Double, vxo: Double, vx: Double)/* -> [String: Double]*/{
        if a == nilDouble {
            kinematicsDict["Acceleration"] = (vx - vxo) / t
        } else if t == nilDouble {
            kinematicsDict["Time"] = (vx - vxo) / a
        } else if vxo == nilDouble {
            kinematicsDict["Initial Velocity"] = vx - a * t
        } else if vx == nilDouble {
            kinematicsDict["Final Velocity"] = vxo + a * t
        }
    }
    
    func performSecondEquation(a: Double, t: Double, vxo: Double, xo: Double, x: Double) {
        if a == nilDouble {
            kinematicsDict["Acceleration"] = (x - (xo + vxo * t)) * 2 / (pow(t, 2))
        } else if t == nilDouble {
            //MARK: FIGURE THIS OUT
            kinematicsDict["Time"] = 2
        } else if vxo == nilDouble {
            kinematicsDict["Initial Velocity"] = (x - (xo + 0.5 * a * pow(t,2))) / t
        } else if xo == nilDouble {
            kinematicsDict["Initial Position"] = (x - (vxo * t + 0.5 * a * pow(t, 2)))
        } else if x == nilDouble {
            kinematicsDict["Final Position"] = xo + vxo * t + 0.5 * a * pow(t, 2)
        }
    }
    
    func performThirdEquation() {
        
    }
    
    /*func performSecondEquation(a: Double, t: Double, vxo: Double, xo: Double, x: Double) {
        if a == nilDouble {
            kinematicsDict["Acceleration"] =
        } else if t == nilDouble {
            kinematicsDict["Time"] =
        } else if vxo == nilDouble {
            kinematicsDict["Initial Velocity"] =
        } else if xo == nilDouble {
            kinematicsDict["Initial Position"] =
        } else if x == nilDouble {
            kinematicsDict["Final Position"] =
        }
    }*/
    
    /*func isObjectAnInt(_ object: AnyObject) -> Bool {
        return Double(object) != nil
    }*/
    
   /* func prepareTextField(placeholder: String, vertDist: CGFloat) -> TextField {
        let textField = TextField()
        textField.placeholder = placeholder
        textField.isClearIconButtonEnabled = true
    view.layout(textField).width(100).height(constant).top(vertDist).right(20)
        return textFiel
    }*/
    
    fileprivate func prepareInitialVelocityField() {
        velocityField = TextField()
        velocityField.placeholder = "Initial Velocity"
        velocityField.isClearIconButtonEnabled = true
        velocityField.placeholderNormalColor = UIColor.textFieldColor()
        velocityField.dividerNormalColor = UIColor.textFieldColor()
        view.layout(velocityField).width(self.view.width - 40).height(constant).top(constant).right(20)
    }
    
    fileprivate func prepareFinalVelocityField() {
        finalVelocityField = TextField()
        finalVelocityField.placeholder = "Final Velocity"
        finalVelocityField.isClearIconButtonEnabled = true
        finalVelocityField.placeholderNormalColor = UIColor.textFieldColor()
        finalVelocityField.dividerNormalColor = UIColor.textFieldColor()
        view.layout(finalVelocityField).width(self.view.width - 40).height(constant).top(constant * 3).right(20)
    }
    
    fileprivate func prepareAccelerationField() {
        accelerationField = TextField()
        accelerationField.placeholder = "Acceleration"
        accelerationField.isClearIconButtonEnabled = true
        accelerationField.placeholderNormalColor = UIColor.textFieldColor()
        accelerationField.dividerNormalColor = UIColor.textFieldColor()
        view.layout(accelerationField).width(self.view.width - 40).height(constant).top(constant * 5).right(20)
    }

    fileprivate func prepareTimeField() {
        timeField = TextField()
        timeField.placeholder = "Time"
        timeField.isClearIconButtonEnabled = true
        timeField.placeholderNormalColor = UIColor.textFieldColor()
        timeField.dividerNormalColor = UIColor.textFieldColor()
        view.layout(timeField).width(self.view.width - 40).height(constant).top(constant * 7).right(20)
    }
    
    fileprivate func prepareInitialPositionField() {
        initialPositionField = TextField()
        initialPositionField.placeholder =  "Initial Position"
        initialPositionField.isClearIconButtonEnabled = true
        initialPositionField.placeholderNormalColor = UIColor.textFieldColor()
        initialPositionField.dividerNormalColor = UIColor.textFieldColor()
        view.layout(initialPositionField).width(self.view.width - 40).height(constant).top(constant * 9).right(20)
    }
    
    fileprivate func prepareFinalPositionField() {
        finalPositionField = TextField()
        finalPositionField.placeholder =  "Final Position"
        finalPositionField.isClearIconButtonEnabled = true
        finalPositionField.placeholderNormalColor = UIColor.textFieldColor()
        finalPositionField.dividerNormalColor = UIColor.textFieldColor()
        view.layout(finalPositionField).width(self.view.width - 40).height(constant).top(constant * 11).right(20)
    }
    
   
    /*
    fileprivate func preparePasswordField() {
        passwordField = TextField()
        passwordField.placeholder = "Password"
        passwordField.detail = "At least 8 characters"
        passwordField.clearButtonMode = .whileEditing
        passwordField.isVisibilityIconButtonEnabled = true
        
        // Setting the visibilityIconButton color.
        passwordField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)
        
        view.layout(passwordField).center().left(20).right(20)
    }*/
    
  
    }
