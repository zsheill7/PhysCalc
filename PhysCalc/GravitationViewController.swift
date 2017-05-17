//
//  GravitationViewController.swift
//  PhysCalc
//
//  Created by Zoe on 5/13/17.
//  Copyright © 2017 kitasuke. All rights reserved.
//

import UIKit

class GravitationViewController: UIViewController {
    class func instantiateFromStoryboard() -> GravitationViewController{
        let storyboard = UIStoryboard(name: "MenuViewController", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! GravitationViewController
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.backgroundColor()
    }
}
