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
import Alamofire

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
        btnFBAction.addTarget(self, action: #selector(facebookLogin), for: .touchUpInside)
        //btnGoogle.addTarget(self, action: #selector(googleLogin), for: .touchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // GOOGLE
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
            print(socialToServer)
            self.socialToServer(Email: email, Name: fullName, Type: 2)
            
            
           
            
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
            
            
            self.socialToServer(Email: email, Name: name, Type: 1)

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
    
    func socialToServer(Email: String ,Name: String,  Type: Int){
        var Success = false
        let parameters: Parameters=[
            "email":Email,//"bryanlowsk@gmail.com",//txtEmail.text!,
            "password":"",//"Bryan987",//txtPassword.text!
            "type":Type
        ]
        let URL_USER_REGISTER = "http://ehostingcentre.com/redcampadmin/API/login.php"
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print("Result :: \(response)")
                if response.result.isSuccess{
                    if let json = response.result.value {
                        let result = json as? [String:AnyObject]
                        if result!["status"] as? Int == 200{
                            print("STATUS Success")
                            let result = self.doCodable(inputData: response.data!, inputAdress: "login")
                            let userDetails = result as! [UserDetails]
                            print(userDetails[0])
                            
                            UserDefaults.standard.set(userDetails[0].name, forKey: "name")
                            UserDefaults.standard.set(userDetails[0].email, forKey: "email")
                            UserDefaults.standard.set(userDetails[0].dob, forKey: "dob")
                            UserDefaults.standard.set(userDetails[0].mobile, forKey: "mobile")
                            
                            UserDefaults.standard.set("1", forKey: "loginStatus")
                            UserDefaults.standard.synchronize()
                            
                            Success = true
                            
                            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "MyNavigationController") as! MyNavigationController
                            self.present(homeVC, animated: true, completion: nil)
                            
                        }else if result!["status"] as? Int == 201{
                            let alert = UIAlertController(title: "Almost There!", message: "Your application to Red Camp is still pending\n\nIf you have not submitted your 'O'level 2018 entry proof, please do so to redcamp@np.edu.sg\n\nThank you for your patience!", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                        }else{
                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                            let SignUpVController = storyBoard.instantiateViewController(withIdentifier: "SignUpSocial") as! SignUpSocial
                            SignUpVController.email_id = Email
                            SignUpVController.firstName = Name
                            
                            if Type == 1{
                               SignUpVController.method = "facebook"
                            }else if Type == 2 {
                                SignUpVController.method = "google"
                            }
                            
                            self.present(SignUpVController, animated:true, completion:nil)
                        }
                    }
                }
        }
        print("socialToServer \(Success)")
       
    }
    
    func doCodable(inputData : Data, inputAdress: String) -> Any
    {
        do {
            
            switch inputAdress
            {
                
            case APIaddress.login.rawValue:
                let decodedData =  try JSONDecoder().decode(ResponseCatagopry.self, from: inputData)
                let result = decodedData.users
                return result
            default:
                print("")
                return ""
            }
            
        } catch let jsonerr
        {
            print(jsonerr)
            return ""
        }
    }
    
}
