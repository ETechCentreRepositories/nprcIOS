//
//  ForgetPassword.swift
//  Redcamp
//
//  Created by Gunjan Pathak on 4/6/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire

class ForgetPassword: UIViewController {

    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var scrollLogin: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailID.attributedPlaceholder = NSAttributedString(string: " Email Address",
                                                              attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetPassword(_ sender: UIButton) {
        
        if (emailID.text?.isEmpty)!{
            let alert = UIAlertController(title: "Forget Password", message:"Email address cannot be emplty" , preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            let parameters: Parameters=[
                "email":emailID.text!,//"bryanlowsk@gmail.com",//txtEmail.text!,
            ]
            let URL_USER_REGISTER = "http://ehostingcentre.com/redcampadmin/API/forgetPassword.php"
            Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
                {
                    response in
                    //printing response
                    print("Result :: \(response)")
                    if response.result.isSuccess{
                        if let json = response.result.value {
                            let result = json as? [String:AnyObject]
                            
                            let alert = UIAlertController(title: "Password Reset", message: String(describing: result!["message"]!), preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                            
                            let LoginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                            self.present(LoginVC, animated: true, completion: nil)

                            
//                            if result!["status"] as? Int == 200{
//                                print("STATUS Success")
//
//
//                            }else{
//
//
//                            }
                        }
                    }
            }
        }
        
       
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
