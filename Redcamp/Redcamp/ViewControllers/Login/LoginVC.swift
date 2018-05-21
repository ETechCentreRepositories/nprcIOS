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

class LoginVC: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate {

    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnFBAction: UIButton!
    @IBOutlet weak var btnGoogleAction: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        btnFacebook.layer.cornerRadius = 15
        btnGoogle.layer.cornerRadius = 15
        btnEmail.layer.cornerRadius = 15
        btnLogin.layer.cornerRadius = 15
        btnFBAction.layer.cornerRadius = 15
        btnGoogleAction.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
        
        btnFacebook.addTarget(self, action: #selector(facebookLogin), for: .touchUpInside)
        //btnGoogle.addTarget(self, action: #selector(googleLogin), for: .touchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func googleSignIn(_ sender: UIButton) {
        GIDSignIn.sharedInstance().delegate=self
        GIDSignIn.sharedInstance().uiDelegate=self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
    }
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                       withError error: Error!) {
        if (error == nil) {
            let fullName = user.profile.name!
            let email = user.profile.email!
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let SignUpVController = storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
            SignUpVController.email_id = email
            SignUpVController.firstName = fullName
            self.present(SignUpVController, animated:true, completion:nil)

            
        } else {
            print("\(error)")
        }
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
            let name = results["name"]!
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let SignUpVController = storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
            SignUpVController.email_id = email
            SignUpVController.firstName = name
            self.present(SignUpVController, animated:true, completion:nil)


        }
    }
    
    @IBAction func Login(_ sender: UIButton)
    {
        let loginActionVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginAction") as! LoginAction
        self.present(loginActionVC, animated: true, completion: nil)
    }

    @IBAction func SignUpEmail(_ sender: UIButton)
    {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.present(signUpVC, animated: true, completion: nil)
    }
}
