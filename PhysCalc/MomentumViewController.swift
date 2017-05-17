//
//  MomentumViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import Material

class MomentumViewController: UIViewController {
    var gists = [[String: AnyObject]]()
    //hi
    fileprivate var mi1: TextField!
    fileprivate var vi1: TextField!
    fileprivate var mi2: TextField!
    fileprivate var vi2: TextField!
    fileprivate var mf1: TextField!
    fileprivate var vf1: TextField!
    fileprivate var mf2: TextField!
    fileprivate var vf2: TextField!
    var nfjf = 1
    
    class func instantiateFromStoryboard() -> MomentumViewController {
        let storyboard = UIStoryboard(name: "MenuViewController", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! MomentumViewController
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.addFullScreenBackground("blue")
        self.view.backgroundColor = UIColor.backgroundColor()
        prepareVf1Field()
        prepareVf2Field()
        prepareVi1Field()
        prepareVi2Field()
    }
}

extension MomentumViewController {
    // MARK: - UITableViewDataSource
    
    fileprivate func prepareVi1Field() {
        vi1 = TextField()
        vi1.placeholder = "Initial Velocity 1"
        vi1.isClearIconButtonEnabled = true
        vi1.placeholderNormalColor = UIColor.textFieldColor()
        vi1.dividerNormalColor = UIColor.textFieldColor()
        view.layout(vi1).width(self.view.width - 40).height(constant).top(constant * 3).right(20)
    }
    fileprivate func prepareVi2Field() {
        vi2 = TextField()
        vi2.placeholder = "Initial Velocity 2"
        vi2.isClearIconButtonEnabled = true
        vi2.placeholderNormalColor = UIColor.textFieldColor()
        vi2.dividerNormalColor = UIColor.textFieldColor()
        view.layout(vi2).width(self.view.width - 40).height(constant).top(constant * 3).right(20)
    }
    fileprivate func prepareVf1Field() {
        vf1 = TextField()
        vf1.placeholder = "Final Velocity 1"
        vf1.isClearIconButtonEnabled = true
        vf1.placeholderNormalColor = UIColor.textFieldColor()
        vf1.dividerNormalColor = UIColor.textFieldColor()
        view.layout(vf1).width(self.view.width - 40).height(constant).top(constant * 3).right(20)
    }
    fileprivate func prepareVf2Field() {
        vf2 = TextField()
        vf2.placeholder = "Final Velocity 2"
        vf2.isClearIconButtonEnabled = true
        vf2.placeholderNormalColor = UIColor.textFieldColor()
        vf2.dividerNormalColor = UIColor.textFieldColor()
        view.layout(vf2).width(self.view.width - 40).height(constant).top(constant * 3).right(20)
    }
    
   /* fileprivate func prepareMassField() {
        massField = TextField()
        massField.placeholder = "Mass"
        massField.isClearIconButtonEnabled = true
        massField.placeholderNormalColor = UIColor.textFieldColor()
        massField.dividerNormalColor = UIColor.textFieldColor()
        view.layout(massField).width(self.view.width - 40).height(constant).top(constant * 5).right(20)
    }*/
    
    
}
