//
//  WebVC.swift
//  Redcamp
//
//  Created by Abhijit on 14/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {

    @IBOutlet weak var wbView: WKWebView!
    
    var currentURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let abouturl = URL(string: currentURL)
        let aboutRequest = URLRequest(url: abouturl!)
        wbView.load(aboutRequest)
        
        //add observer to get estimated progress value
        self.wbView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(self.wbView.estimatedProgress);
            // self.progressView.progress = Float(self.webView.estimatedProgress);
        }
    }
}
