//
//  LoginVC.swift
//  Redcamp
//
//  Created by Abhijit on 9/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

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
        
        btnFacebook.addTarget(self, action: #selector(facebookLogin), for: .touchUpInside)
        //btnGoogle.addTarget(self, action: #selector(googleLogin), for: .touchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func facebookLogin(){
        FBSDKLoginManager().logIn(withReadPermissions: ["email","public_profile"], from: self)
        { (Result, error) in
            if error != nil{
                print("Login Failed")
                return
            }
            self.showDetails()
        }
    }
    
    
    func showDetails(){
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields" : "name,  email " ]).start{
            (connection, result , error ) in
            if error != nil{
                print("Failed get Details")
                return
            }
            print(result)
            let results : [String: String] = result as! [String: String]
            let email = results["email"]!
            var components = results["name"]!.components(separatedBy: " ")
            var first_name = ""
            var last_name = ""
            if(components.count > 0)
            {
                first_name = components.removeFirst()
                last_name = components.joined(separator: " ")
            }
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let SignUpVController = storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
            SignUpVController.email_id = email
            SignUpVController.firstName = first_name
            SignUpVController.lastName = last_name
            self.present(SignUpVController, animated:true, completion:nil)


        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("User \(user)")
    }
    


}
