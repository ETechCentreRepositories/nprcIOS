//
//  LoginAction.swift
//  Redcamp
//
//  Created by Abhijit on 14/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire

class LoginAction: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        txtPassword.borderStyle = .line
        txtPassword.layer.borderColor = UIColor.white.cgColor
        txtPassword.layer.borderWidth = 1.5
        txtEmail.borderStyle = .line
        txtEmail.layer.borderColor = UIColor.white.cgColor
        txtEmail.layer.borderWidth = 1.5
        
        txtPassword.attributedPlaceholder = NSAttributedString(string: " Password",
                                                              attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtEmail.attributedPlaceholder = NSAttributedString(string: " Email",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Login(_ sender: UIButton) {
        let parameters: Parameters=[
            "email":"bryanlowsk@gmail.com",//txtEmail.text!,
            "password":"Bryan987"//txtPassword.text!
        ]
        let URL_USER_REGISTER = "http://bryanlowsk.com/RedCamp/API/login.php"
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
        {
                response in
                //printing response
                print(" URL LOGIN RESPONSE \(response)")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backAction(_ sender: Any)
    {
        self.dismiss(animated:true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        switch textField
        {
        case txtEmail:
            txtPassword.becomeFirstResponder()
            break
        case txtPassword:
             txtPassword.resignFirstResponder()
            break
        
        default:
            return true
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        //txtViewContent.setContentOffset(textField.bounds.origin, animated: true)
        return true
    }
}
