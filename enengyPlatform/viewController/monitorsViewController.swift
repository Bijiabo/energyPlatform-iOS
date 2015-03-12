//
//  monitorsViewController.swift
//  enengyPlatform
//
//  Created by bijiabo on 15/3/12.
//  Copyright (c) 2015年 JYLabs. All rights reserved.
//

import UIKit
import WebKit

class monitorsViewController: UIViewController, WKNavigationDelegate, UINavigationBarDelegate{
  
  @IBOutlet var navigationBar: UINavigationBar!
  
  var webView : WKWebView!
  var userContentController : WKUserContentController!
  var configuration : WKWebViewConfiguration!
  var hostDomain : String = "http://192.168.1.102"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let handler = monitorsNotificationScriptMessageHandler(viewController: self)
    userContentController = WKUserContentController()
    userContentController.addScriptMessageHandler(handler, name: "notification")
    
    configuration = WKWebViewConfiguration()
    configuration.userContentController = userContentController
    
    var webViewFrame = view.frame
    webViewFrame.origin.y = navigationBar.frame.size.height+1.0
    webViewFrame.size.height -= navigationBar.frame.size.height-1.0
    webView = WKWebView(frame: webViewFrame, configuration: configuration)
    webView.navigationDelegate = self
    view.addSubview(webView)
    view.sendSubviewToBack(webView)
    let url : NSURL! = NSURL(string: "\(hostDomain)/monitors/ios/main")
    let req : NSURLRequest = NSURLRequest(URL: url)
    webView.loadRequest(req)
    
    view.bringSubviewToFront(navigationBar)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func navigationBar(navigationBar: UINavigationBar, shouldPopItem item: UINavigationItem) -> Bool {
    println("navigation bar")
    let source = "Router.go(\"newsList\")"
    
    webView.evaluateJavaScript(source, completionHandler: nil)
    
    return true
  }
  
}


class monitorsNotificationScriptMessageHandler: NSObject, WKScriptMessageHandler
{
  var vc : monitorsViewController!
  
  init(viewController : monitorsViewController) {
    vc = viewController
  }
  
  func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage)
  {
    println(message.body["action"])
    
    if let action = message.body["action"] as? String
    {
      switch action
      {
      case "pushNavigationItem":
        if vc.navigationBar.items.count<2
        {
          vc.navigationBar.pushNavigationItem(UINavigationItem(title: message.body["title"] as String!), animated: true)
        }
        
      case "popNavigationItemAnimated":
        if vc.navigationBar.items.count>1
        {
          vc.navigationBar.popNavigationItemAnimated(true)
        }
        
        
      default:
        println("")
      }
    }
    
  }
  
}

