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
    @IBOutlet weak var scrollLogin: UIScrollView!
    
   // @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    weak var activeField: UITextField?
    
    var email_id = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        //registerForKeyboardNotifications()
        
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
                self.scrollLogin.contentInset = contentInsets
                self.scrollLogin.scrollIndicatorInsets = contentInsets
                var aRect = self.view.frame
                aRect.size.height -= keyboardSize.size.height
                if (!aRect.contains(activeField.frame.origin)) {
                    self.scrollLogin.scrollRectToVisible(activeField.frame, animated: true)
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
            self.scrollLogin.contentInset = contentInsets
            self.scrollLogin.scrollIndicatorInsets = contentInsets
            
        } else {
            debugPrint("We're about to hide the keyboard and the keyboard size is nil. Now is the rapture.")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        self.activeField = nil
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        self.activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        switch textField
        {
        case txtEmail:
            txtPassword.becomeFirstResponder()
            return true
            break
        case txtPassword:
            txtPassword.resignFirstResponder()
            return true
            break
        default:
            return true
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDetails(){
        if txtEmail.text!.isEmpty{
            let alert = UIAlertController(title: "Email Id", message: "Email Id cannot be Empty.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else if txtPassword.text!.isEmpty{
            let alert = UIAlertController(title: "Password", message: "Password cannot be Empty.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            email_id = txtEmail.text!
            password = txtPassword.text!
            callServerLogin()
        }
    }
    
    @IBAction func forgetpass(_ sender: UIButton) {
        let alert = UIAlertController(title: "Forgot Passwrod", message: "Please email redcamp@np.edu.sg with your new password and we'll take it from there !", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
    @IBAction func Login(_ sender: UIButton)
    {
        getDetails()
    }
    
    func callServerLogin(){
       /* let parameters: Parameters=[
            "email" : email_id,
            "password" : password
        ]*/
        let parameters: Parameters=[
            "email":"bryanlowsk@gmail.com",//txtEmail.text!,
            "password":"Bryan987"//txtPassword.text!
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
                            
                            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "MyNavigationController") as! MyNavigationController
                            self.present(homeVC, animated: true, completion: nil)
                            
                        }else{
                            let alert = UIAlertController(title: "Wrong Passwrod", message: "Username and Password is incorrect.", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                        }
                    }
                }
        }
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
    
   
}
//--------------------
enum APIaddress: String
{
    case categories     = "getCategories"
    case login          = "login"
}
//--------------------
enum UserResponseKeys: String, CodingKey
{
    case status                 = "status"
    case message                = "message"
    case users                 = "users"
    //----------------------
    case id                     = "id"
    case diet_requirements      = "diet_requirements"
    case dob                    = "dob"
    case name                   = "name"
    case email                  = "email"
    case nric                   = "nric"
    case password               = "password"
    case school                 = "school"
    case mobile                 = "mobile"
    //-------------------
}

//------------------

//-------------------------------------------------------------------------------------------------
class ResponseCatagopry : Decodable
{
    var status : Int
    var message : String
    var users : [UserDetails]
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: UserResponseKeys.self)
        self.status = (try container.decodeIfPresent(Int.self, forKey: .status))!
        self.message = (try container.decodeIfPresent(String.self, forKey: .message))!
        self.users = (try container.decodeIfPresent([UserDetails].self, forKey: .users))!
    }
}

//-------------------------------------------------------------------------------------------------
class UserDetails : Decodable
{
    var diet_requirements : String
    var dob : String
    var email : String
    var id : String
    var mobile : String
    var name : String
    var nric : String
    var password : String
    var school : String
    var status : String
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: UserResponseKeys.self)
        do {
            
            self.id = " "
            self.diet_requirements = " "
            self.dob = " "
            self.email = " "
            self.mobile = " "
            self.name = " "
            self.nric = " "
            self.password = " "
            self.school = " "
            self.status = " "
            
            if let id = (try container.decodeIfPresent(String.self, forKey: .id))
            {
                self.id = id
            }
            if let diet_requirements = (try container.decodeIfPresent(String.self, forKey: .diet_requirements))
            {
                self.diet_requirements = diet_requirements
            }
            if let dob =  (try container.decodeIfPresent(String.self, forKey: .dob))
            {
                self.dob = dob
            }
            if let email =  (try container.decodeIfPresent(String.self, forKey: .email))
            {
                self.email = email
            }
            if let mobile =  (try container.decodeIfPresent(String.self, forKey: .mobile))
            {
                self.mobile = mobile
            }
            if let name =  (try container.decodeIfPresent(String.self, forKey: .name))
            {
                self.name = name
            }
            if let nric =  (try container.decodeIfPresent(String.self, forKey: .nric))
            {
                self.nric = nric
            }
            if let password =  (try container.decodeIfPresent(String.self, forKey: .password))
            {
                self.password = password
            }
            if let school =  (try container.decodeIfPresent(String.self, forKey: .school))
            {
                self.school = school
            }
            if let status =  (try container.decodeIfPresent(String.self, forKey: .status))
            {
                self.status = status
            }
            
        } catch let jsonerr
        {
            print(jsonerr)
            
            self.id = " "
            self.diet_requirements = " "
            self.dob = " "
            self.email = " "
            self.mobile = " "
            self.name = " "
            self.nric = " "
            self.password = " "
            self.school = " "
            self.status = " "
        }
        
    }
}

