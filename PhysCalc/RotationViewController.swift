//
//  RotationViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {
    var organizations = [[String: AnyObject]]()
    
    class func instantiateFromStoryboard() -> RotationViewController {
        let storyboard = UIStoryboard(name: "MenuViewController", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! RotationViewController
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.backgroundColor()
        let url = URL(string: "https://api.github.com/organizations")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            let result = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
            self?.organizations = result ?? []
            
            DispatchQueue.main.async(execute: { () -> Void in
              
            })
        }
        task.resume()
    }
}
