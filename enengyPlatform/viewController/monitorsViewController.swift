//
//  monitorsViewController.swift
//  enengyPlatform
//
//  Created by bijiabo on 15/3/12.
//  Copyright (c) 2015年 JYLabs. All rights reserved.
//

import UIKit
import WebKit

class monitorsViewController: webkitViewController{
  
  @IBOutlet var navigationbar: UINavigationBar!
  @IBOutlet var nodesListButton: UIBarButtonItem!
  
  override func viewDidLoad() {
    navigationBar = navigationbar
    defaultPath = ["path":"/monitors/ios/main","routerName":"monitorIosMain"]
    
    super.viewDidLoad()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func clickNodesListButton(sender: AnyObject) {
    let url : NSURL! = NSURL(string: hostDomain + "/nodesAll")
    let req : NSURLRequest = NSURLRequest(URL: url)
    webView.loadRequest(req)
  }
}




