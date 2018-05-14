//
//  LoginVC.swift
//  Redcamp
//
//  Created by Abhijit on 9/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        btnFacebook.layer.cornerRadius = 10
        btnGoogle.layer.cornerRadius = 10
        btnEmail.layer.cornerRadius = 10
        btnLogin.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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