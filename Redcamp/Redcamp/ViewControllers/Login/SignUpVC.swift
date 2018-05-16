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

class SignUpVC: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource
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
    @IBOutlet weak var scrollSignUp: UIScrollView!
    
    @IBOutlet weak var constPickBottom: NSLayoutConstraint!
    weak var activeField: UITextField?
    
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
        
        txtPassword.attributedPlaceholder = NSAttributedString(string: " Paasword",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Email",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtConfirmPassword.attributedPlaceholder = NSAttributedString(string: " Confirm Password",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtEmail.attributedPlaceholder = NSAttributedString(string: " Email",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtFirstName.attributedPlaceholder = NSAttributedString(string: " First Name",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtLastName.attributedPlaceholder = NSAttributedString(string: " Last Name",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtBirthDate.attributedPlaceholder = NSAttributedString(string: " Birth Date",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtDietryReq.attributedPlaceholder = NSAttributedString(string: " *Dietry Requirements",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtSecSchool.attributedPlaceholder = NSAttributedString(string: " *Secondary School",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtContact.attributedPlaceholder = NSAttributedString(string: " *Mobile Number",
                                                                attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        self.setupViewResizerOnKeyboardShown()
        self.scrollSignUp.scrollsToTop = true
        self.removeAnimate()
        
    }
    
    func showAnimate()
    {
        self.constPickBottom.constant = 400
        UIView.animate(withDuration: 0.8, animations: {
            self.view.alpha = 1.0
            self.view.transform =  CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion:{(finished : Bool) in
            if(finished)
            {
               self.constPickBottom.constant = 0
            }
        })
    }
    
    func removeAnimate()
    {
        self.constPickBottom.constant = 0
        UIView.animate(withDuration: 0.8, animations: {
        }, completion:{(finished : Bool) in
            if(finished)
            {
                self.constPickBottom.constant = 400
            }
        })
    }
    
    func setupViewResizerOnKeyboardShown()
    {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShowForResizing),
                                               name: Notification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHideForResizing),
                                               name: Notification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    @objc func keyboardWillShowForResizing(notification: Notification)
    {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let _ = self.view.window?.frame
        {
            if let activeField = self.activeField
            {
                let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
                self.scrollSignUp.contentInset = contentInsets
                self.scrollSignUp.scrollIndicatorInsets = contentInsets
                var aRect = self.view.frame
                aRect.size.height -= keyboardSize.size.height
                if (!aRect.contains(activeField.frame.origin)) {
                    self.scrollSignUp.scrollRectToVisible(activeField.frame, animated: true)
                }
            }
            
        } else {
            debugPrint("We're showing the keyboard and either the keyboard size or window is nil: panic widely.")
        }
    }
    
    @objc func keyboardWillHideForResizing(notification: Notification)
    {
        if ((notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil
        {
            let contentInsets = UIEdgeInsets.zero
            self.scrollSignUp.contentInset = contentInsets
            self.scrollSignUp.scrollIndicatorInsets = contentInsets
            
        } else {
            debugPrint("We're about to hide the keyboard and the keyboard size is nil. Now is the rapture.")
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
    @IBAction func rememberMe(_ sender: Any) {
    }
    
    @IBAction func signUp(_ sender: Any) {
    }
    
    
    @IBAction func backAction(_ sender: Any)
    {
        self.dismiss(animated:true, completion: nil)
    }
    
    @IBAction func savePickerValue(_ sender: Any)
    {
        self.removeAnimate()
    }
    
    
    @IBAction func cancelPickerSelection(_ sender: Any)
    {
        self.removeAnimate()
    }
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        self.activeField = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == self.txtDietryReq
        {
            txtDietryReq.resignFirstResponder()
            self.showAnimate()
        }
        else if textField == self.txtSecSchool
        {
            self.showAnimate()
        }
        else
        {
            self.activeField = textField
        }
        
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
        case txtDietryReq:
            txtDietryReq.resignFirstResponder()
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "Vegeterian"
    }
}
