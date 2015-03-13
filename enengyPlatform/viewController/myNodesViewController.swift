//
//  myNodesViewController.swift
//  enengyPlatform
//
//  Created by bijiabo on 15/3/11.
//  Copyright (c) 2015年 JYLabs. All rights reserved.
//

import UIKit
import WebKit

class myNodesViewController: webkitViewController{
  
  
  @IBOutlet var navigationbar: UINavigationBar!
  
  override func viewDidLoad() {
    navigationBar = navigationbar
    defaultPath = ["path":"/nodes","routerName":"nodesList"]
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
