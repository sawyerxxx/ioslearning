//
//  ViewController.swift
//  Project 4: Easy Browser with WKWebView
//
//  Created by sawyerhuang on 16/3/25.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
    var webView:WKWebView!
    var progressView:UIProgressView!
    var websites = ["apple.com", "hackingwithswift.com"] // an array containing the websites we want the user to be able to visit
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)//add ourselves as an observer of the property on the web view

        let url = NSURL(string: "https://" + websites[0])!
        webView.loadRequest(NSURLRequest(URL: url))
        webView.allowsBackForwardNavigationGestures = true //允许滑动手势前进后退
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "open", style: .Plain, target: self, action: "openTapped")
        
        progressView = UIProgressView(progressViewStyle: .Default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil) //.flexiblespace
        let refresh = UIBarButtonItem(barButtonSystemItem: .Refresh, target: webView, action: "reload") //when the bar button is tapped webView.reload() is called
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.toolbarHidden = false
    }

    //tells you when an observed value has changed
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "estimatedProgress" {
            progressView?.progress = Float(webView.estimatedProgress)
        }
    }
    
    func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .ActionSheet)
//        ac.addAction(UIAlertAction(title: "apple.com", style: .Default, handler: openPage))
//        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .Default, handler: openPage))
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .Default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        //ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem//If  chose iPad or Universal
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func refreshTapped() {
        
    }
    
    func openPage(action:UIAlertAction!) {
        let url = NSURL(string: "https://" + action.title!)!
        webView.loadRequest(NSURLRequest(URL: url))
    }
    
    //All this method does it update our view controller's title property to be the title of the web view, which will automatically be set to the page title of the web page that was most recently loaded.
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        title = webView.title
    }
    
    //we need to evaluate the URL to see whether it's in our safe list, then call the decisionHandler with a negative or positive answer
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.URL
        
        if let host = url!.host {
            for website in websites {
                if host.rangeOfString(website) != nil {
                    decisionHandler(.Allow)
                    return
                }
            }
        }
        decisionHandler(.Cancel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

