//
//  EnergyViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import Material

class EnergyViewController: UIViewController {
    var repositories = [[String: AnyObject]]()
    
    fileprivate var massField: TextField!
    fileprivate var velocityField: TextField!
    
    class func instantiateFromStoryboard() -> EnergyViewController {
        let storyboard = UIStoryboard(name: "MenuViewController", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! EnergyViewController
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.addFullScreenBackground("blue")
        self.view.backgroundColor = UIColor.backgroundColor()
        
        prepareVelocityField()
        prepareMassField()
        prepareCalculateButton()
        
    }
}

extension EnergyViewController {
    // MARK: - UITableViewDataSource
    
    fileprivate func prepareCalculateButton() {
        let btn = RaisedButton(title: "Calculate", titleColor: Color.blue.base)
       // btn.addTarget(self, action: #selector(handleResignResponderButton(button:)), for: .touchUpInside)
        
        view.layout(btn).width(self.view.width - 40).height(constant).top(constant * 13).right(20)
    }
    
    fileprivate func prepareVelocityField() {
        velocityField = TextField()
        velocityField.placeholder = "Velocity"
        velocityField.isClearIconButtonEnabled = true
        velocityField.placeholderNormalColor = UIColor.textFieldColor()
        velocityField.dividerNormalColor = UIColor.textFieldColor()
        view.layout(velocityField).width(self.view.width - 40).height(constant).top(constant * 3).right(20)
    }
    
    fileprivate func prepareMassField() {
        massField = TextField()
        massField.placeholder = "Mass"
        massField.isClearIconButtonEnabled = true
        massField.placeholderNormalColor = UIColor.textFieldColor()
        massField.dividerNormalColor = UIColor.textFieldColor()
        view.layout(massField).width(self.view.width - 40).height(constant).top(constant * 5).right(20)
    }
    
}
