//
//  SignUpVC.swift
//  Redcamp
//
//  Created by Abhijit on 14/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

extension UITextField
{
    func setCustomBorder()
    {
        self.borderStyle = .line
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.5
    }
}
class SignUpVC: UIViewController
{

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnScanID: UIButton!
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtBirthDate: UITextField!
    @IBOutlet weak var txtContact: UITextField!
    @IBOutlet weak var txtSecSchool: UITextField!
    @IBOutlet weak var txtDietryReq: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        btnScanID.layer.cornerRadius = 10
        btnSignUp.layer.cornerRadius = 10
        
        txtPassword.setCustomBorder()
        txtEmail.setCustomBorder()
        txtConfirmPassword.setCustomBorder()
        txtFirstName.setCustomBorder()
        txtLastName.setCustomBorder()
        txtBirthDate.setCustomBorder()
        txtDietryReq.setCustomBorder()
        txtSecSchool.setCustomBorder()
        txtContact.setCustomBorder()
        
        txtPassword.attributedPlaceholder = NSAttributedString(string: "Paasword",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Email",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtConfirmPassword.attributedPlaceholder = NSAttributedString(string: "Confirm Password",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Email",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtFirstName.attributedPlaceholder = NSAttributedString(string: "First Name",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtLastName.attributedPlaceholder = NSAttributedString(string: "Last Name",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtBirthDate.attributedPlaceholder = NSAttributedString(string: "Birth Date",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtDietryReq.attributedPlaceholder = NSAttributedString(string: "*Dietry Requirements",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtSecSchool.attributedPlaceholder = NSAttributedString(string: "*Secondary School",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtContact.attributedPlaceholder = NSAttributedString(string: "*Mobile Number",
                                                                attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func rememberMe(_ sender: Any) {
    }
    
    @IBAction func signUp(_ sender: Any) {
    }
}
