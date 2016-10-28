//
//  WebViewCon.swift
//  BBTJson
//
//  Created by Ashok Machineni on 10/27/16.
//  Copyright © 2016 Ashok Machineni. All rights reserved.
//

import UIKit
class WebViewCon: UIViewController, UIWebViewDelegate {
    @IBOutlet var videosWeb : UIWebView!
    var link: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videosWeb.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let url = link {
            let request = URLRequest(url: url)
            videosWeb.loadRequest(request)
        }
    }
    
    // MARK: - UIWebViewDelegate
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("Did start load")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Did finish load")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Did fail load with error: \(error)")
    }
}
