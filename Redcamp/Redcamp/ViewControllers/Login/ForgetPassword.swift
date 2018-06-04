//
//  ForgetPassword.swift
//  Redcamp
//
//  Created by Gunjan Pathak on 4/6/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class ForgetPassword: UIViewController {

    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var scrollLogin: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetPassword(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
