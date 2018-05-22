//
//  SignUpSocial.swift
//  Redcamp
//
//  Created by Gunjan Pathak on 21/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire


class SignUpSocial: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    let diet = ["None","Vegetarian"]
    let school = ["ADMIRALTY SECONDARY SCHOOL"
        , "AHMAD IBRAHIM SECONDARY SCHOOL"
        , "ANDERSON SECONDARY SCHOOL"
        , "ANG MO KIO SECONDARY SCHOOL"
        , "ANGLICAN HIGH SCHOOL"
        , "ANGLO-CHINESE SCHOOL (BARKER ROAD)"
        , "ANGLO-CHINESE SCHOOL (INDEPENDENT)"
        , "ASSUMPTION ENGLISH SCHOOL"
        , "BARTLEY SECONDARY SCHOOL"
        , "BEATTY SECONDARY SCHOOL"
        , "BEDOK GREEN SECONDARY SCHOOL"
        , "BEDOK NORTH SECONDARY SCHOOL"
        , "BEDOK SOUTH SECONDARY SCHOOL"
        , "BEDOK VIEW SECONDARY SCHOOL"
        , "BENDEMEER SECONDARY SCHOOL"
        , "BISHAN PARK SECONDARY SCHOOL"
        , "BOON LAY SECONDARY SCHOOL"
        , "BOWEN SECONDARY SCHOOL"
        , "BROADRICK SECONDARY SCHOOL"
        , "BUKIT BATOK SECONDARY SCHOOL"
        , "BUKIT MERAH SECONDARY SCHOOL"
        , "BUKIT PANJANG GOVT. HIGH SCHOOL"
        , "BUKIT VIEW SECONDARY SCHOOL"
        , "CANBERRA SECONDARY SCHOOL"
        , "CATHOLIC HIGH SCHOOL"
        , "CEDAR GIRLS' SECONDARY SCHOOL"
        , "CHANGKAT CHANGI SECONDARY SCHOOL"
        , "CHIJ KATONG CONVENT"
        , "CHIJ SECONDARY (TOA PAYOH)"
        , "CHIJ ST. JOSEPH'S CONVENT"
        , "CHIJ ST. NICHOLAS GIRLS' SCHOOL"
        , "CHIJ ST. THERESA'S CONVENT"
        , "CHONG BOON SECONDARY SCHOOL"
        , "CHRIST CHURCH SECONDARY SCHOOL"
        , "CHUA CHU KANG SECONDARY SCHOOL"
        , "CHUNG CHENG HIGH SCHOOL (MAIN)"
        , "CHUNG CHENG HIGH SCHOOL (YISHUN)"
        , "CLEMENTI TOWN SECONDARY SCHOOL"
        , "COMMONWEALTH SECONDARY SCHOOL"
        , "COMPASSVALE SECONDARY SCHOOL"
        , "CRESCENT GIRLS' SCHOOL"
        , "DAMAI SECONDARY SCHOOL"
        , "DEYI SECONDARY SCHOOL"
        , "DUNEARN SECONDARY SCHOOL"
        , "DUNMAN HIGH SCHOOL"
        , "DUNMAN SECONDARY SCHOOL"
        , "EAST SPRING SECONDARY SCHOOL"
        , "EAST VIEW SECONDARY SCHOOL"
        , "EDGEFIELD SECONDARY SCHOOL"
        , "EVERGREEN SECONDARY SCHOOL"
        , "FAIRFIELD METHODIST SCHOOL (SECONDARY)"
        , "FAJAR SECONDARY SCHOOL"
        , "FUCHUN SECONDARY SCHOOL"
        , "FUHUA SECONDARY SCHOOL"
        , "GAN ENG SENG SCHOOL"
        , "GEYLANG METHODIST SCHOOL (SECONDARY)"
        , "GREENDALE SECONDARY SCHOOL"
        , "GREENRIDGE SECONDARY SCHOOL"
        , "GREENVIEW SECONDARY SCHOOL"
        , "GUANGYANG SECONDARY SCHOOL"
        , "HAI SING CATHOLIC SCHOOL"
        , "HILLGROVE SECONDARY SCHOOL"
        , "HOLY INNOCENTS' HIGH SCHOOL"
        , "HONG KAH SECONDARY SCHOOL"
        , "HOUGANG SECONDARY SCHOOL"
        , "HUA YI SECONDARY SCHOOL"
        , "HWA CHONG INSTITUTION"
        , "JUNYUAN SECONDARY SCHOOL"
        , "JURONG SECONDARY SCHOOL"
        , "JURONG WEST SECONDARY SCHOOL"
        , "JURONGVILLE SECONDARY SCHOOL"
        , "JUYING SECONDARY SCHOOL"
        , "KENT RIDGE SECONDARY SCHOOL"
        , "KRANJI SECONDARY SCHOOL"
        , "KUO CHUAN PRESBYTERIAN SECONDARY SCHOOL"
        , "LOYANG SECONDARY SCHOOL"
        , "MANJUSRI SECONDARY SCHOOL"
        , "MARIS STELLA HIGH SCHOOL"
        , "MARSILING SECONDARY SCHOOL"
        , "MAYFLOWER SECONDARY SCHOOL"
        , "METHODIST GIRLS' SCHOOL (SECONDARY)"
        , "MONTFORT SECONDARY SCHOOL"
        , "NAN CHIAU HIGH SCHOOL"
        , "NAN HUA HIGH SCHOOL"
        , "NANYANG GIRLS' HIGH SCHOOL"
        , "NAVAL BASE SECONDARY SCHOOL"
        , "NEW TOWN SECONDARY SCHOOL"
        , "NGEE ANN SECONDARY SCHOOL"
        , "NORTH VISTA SECONDARY SCHOOL"
        , "NORTHBROOKS SECONDARY SCHOOL"
        , "NORTHLAND SECONDARY SCHOOL"
        , "NUS HIGH SCHOOL OF MATHEMATICS AND SCIENCE"
        , "ORCHID PARK SECONDARY SCHOOL"
        , "OUTRAM SECONDARY SCHOOL"
        , "PASIR RIS CREST SECONDARY SCHOOL"
        , "PASIR RIS SECONDARY SCHOOL"
        , "PAYA LEBAR METHODIST GIRLS' SCHOOL (SECONDARY)"
        , "PEI HWA SECONDARY SCHOOL"
        , "PEICAI SECONDARY SCHOOL"
        , "PEIRCE SECONDARY SCHOOL"
        , "PING YI SECONDARY SCHOOL"
        , "PRESBYTERIAN HIGH SCHOOL"
        , "PUNGGOL SECONDARY SCHOOL"
        , "QUEENSTOWN SECONDARY SCHOOL"
        , "QUEENSWAY SECONDARY SCHOOL"
        , "RAFFLES GIRLS' SCHOOL (SECONDARY)"
        , "RAFFLES INSTITUTION"
        , "REGENT SECONDARY SCHOOL"
        , "RIVER VALLEY HIGH SCHOOL"
        , "RIVERSIDE SECONDARY SCHOOL"
        , "SCHOOL OF SCIENCE AND TECHNOLOGY, SINGAPORE"
        , "SCHOOL OF THE ARTS, SINGAPORE"
        , "SEMBAWANG SECONDARY SCHOOL"
        , "SENG KANG SECONDARY SCHOOL"
        , "SERANGOON GARDEN SECONDARY SCHOOL"
        , "SERANGOON SECONDARY SCHOOL"
        , "SHUQUN SECONDARY SCHOOL"
        , "SINGAPORE CHINESE GIRLS' SCHOOL"
        , "SINGAPORE SPORTS SCHOOL"
        , "SPRINGFIELD SECONDARY SCHOOL"
        , "ST. ANDREW'S SECONDARY SCHOOL"
        , "ST. ANTHONY'S CANOSSIAN SECONDARY SCHOOL"
        , "ST. GABRIEL'S SECONDARY SCHOOL"
        , "ST. HILDA'S SECONDARY SCHOOL"
        , "ST. JOSEPH'S INSTITUTION"
        , "ST. MARGARET'S SECONDARY SCHOOL"
        , "ST. PATRICK'S SCHOOL"
        , "SWISS COTTAGE SECONDARY SCHOOL"
        , "TAMPINES SECONDARY SCHOOL"
        , "TANGLIN SECONDARY SCHOOL"
        , "TANJONG KATONG GIRLS' SCHOOL"
        , "TANJONG KATONG SECONDARY SCHOOL"
        , "TECK WHYE SECONDARY SCHOOL"
        , "TEMASEK SECONDARY SCHOOL"
        , "UNITY SECONDARY SCHOOL"
        , "VICTORIA SCHOOL"
        , "WEST SPRING SECONDARY SCHOOL"
        , "WESTWOOD SECONDARY SCHOOL"
        , "WHITLEY SECONDARY SCHOOL"
        , "WOODGROVE SECONDARY SCHOOL"
        , "WOODLANDS RING SECONDARY SCHOOL"
        , "WOODLANDS SECONDARY SCHOOL"
        , "XINMIN SECONDARY SCHOOL"
        , "YIO CHU KANG SECONDARY SCHOOL"
        , "YISHUN SECONDARY SCHOOL"
        , "YISHUN TOWN SECONDARY SCHOOL"
        , "YUAN CHING SECONDARY SCHOOL"
        , "YUHUA SECONDARY SCHOOL"
        , "YUSOF ISHAK SECONDARY SCHOOL"
        , "YUYING SECONDARY SCHOOL"
        , "ZHENGHUA SECONDARY SCHOOL"
        , "ZHONGHUA SECONDARY SCHOOL"
        , "MERIDIAN SECONDARY SCHOOL"
        , "OTHERS"]
    var pickerTag = ""
    var firstName = ""
    var email_id  = ""
    var nric = ""
    var dob = Date()
    var mobile = ""
    var secSchool = ""
    var dietSelected = ""
    var password = ""
    var status = 0
    var OCR = ""
    var year = 1
    var terms = false
    var method = ""
    

    
    @IBOutlet weak var btnSignUp: UIButton!
    
    
    @IBOutlet weak var txtnric: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtBirthDate: UITextField!
    @IBOutlet weak var txtContact: UITextField!
    @IBOutlet weak var txtSecSchool: UITextField!
    @IBOutlet weak var txtDietryReq: UITextField!
    @IBOutlet weak var scrollSignUp: UIScrollView!
    @IBOutlet weak var termsCheckBox: UIButton!
    
    let datePicker = UIDatePicker()
    let thePicker = UIPickerView()
    
    @IBOutlet weak var constPickBottom: NSLayoutConstraint!
    weak var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("OCR :: \(OCR)")
        
        createPickerView()
        createDatePicker()
        
        thePicker.delegate = self
        txtDietryReq.inputView = thePicker
        txtSecSchool.inputView = thePicker
        txtDietryReq.delegate = self
        txtSecSchool.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        
        btnSignUp.layer.cornerRadius = 10
        
        txtnric.delegate = self
        txtFirstName.setCustomBorder()
        txtnric.setCustomBorder()
        txtBirthDate.setCustomBorder()
        txtDietryReq.setCustomBorder()
        txtSecSchool.setCustomBorder()
        txtContact.setCustomBorder()
        
        txtFirstName.attributedPlaceholder = NSAttributedString(string: " Full Name",
                                                                attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtnric.attributedPlaceholder = NSAttributedString(string: " NRIC (XXXXX)",
                                                           attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtBirthDate.attributedPlaceholder = NSAttributedString(string: " Date of Birth (DD-MM-YYYY)",
                                                                attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtDietryReq.attributedPlaceholder = NSAttributedString(string: " * Dietry Requirements",
                                                                attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtSecSchool.attributedPlaceholder = NSAttributedString(string: " * Secondary School",
                                                                attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtContact.attributedPlaceholder = NSAttributedString(string: " * Mobile Number",
                                                              attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        self.setupViewResizerOnKeyboardShown()
        self.scrollSignUp.scrollsToTop = true
       // self.removeAnimate()
        
        
        if !firstName.isEmpty{
            txtFirstName.text = firstName
        }
        if !OCR.isEmpty{
            txtnric.text = OCR
        }
    }
    
//    func showAnimate()
//    {
//        self.constPickBottom.constant = 400
//        UIView.animate(withDuration: 0.8, animations: {
//            self.view.alpha = 1.0
//            self.view.transform =  CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }, completion:{(finished : Bool) in
//            if(finished)
//            {
//                self.constPickBottom.constant = 0
//            }
//        })
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = txtnric.text else { return true }
        if textField == self.txtnric{
            let newLength = text.characters.count + string.characters.count - range.length
            print(newLength)
            return newLength <= 5 // Bool
        }
        
        return true
    }
    
//    func removeAnimate()
//    {
//        self.constPickBottom.constant = 0
//        UIView.animate(withDuration: 0.8, animations: {
//        }, completion:{(finished : Bool) in
//            if(finished)
//            {
//                self.constPickBottom.constant = 400
//            }
//        })
//    }
    
    func createDatePicker(){
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        toolbar.setItems([doneButton], animated: false)
        txtBirthDate.inputAccessoryView = toolbar
        txtBirthDate.inputView = datePicker
        
    }
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dob = datePicker.date
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        txtBirthDate.text = dateFormatter.string(from: datePicker.date)
        
        
        dateFormatter.dateFormat = "YYYY"
        year = Int(dateFormatter.string(from: self.datePicker.date))!
        
        print("YEAR\(year)")
        if year <= 2000{
            status = 1
        }else if year >= 2003{
            status = 3
        }else{
            status = 2
        }
        
        print("Status \(status)")
        self.view.endEditing(true)
    }
    
    
    func createPickerView(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(savePressed))
        toolbar.setItems([doneButton], animated: false)
        
        txtDietryReq.inputAccessoryView = toolbar
        txtDietryReq.inputView = thePicker
        
        txtSecSchool.inputAccessoryView = toolbar
        txtSecSchool.inputView = thePicker
    }
    
    @objc func savePressed(){
        print("Selected Value")
        txtDietryReq.resignFirstResponder()
        txtSecSchool.resignFirstResponder()
        
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
    
    
    @IBAction func signUpDetails(_ sender: UIButton) {
        print("Sign Up ")
        getStudentDetails()
        
        let URL_USER_REGISTER = "http://ehostingcentre.com/redcampadmin/API/addUsers.php"
        let parameters: Parameters=[
            "name":firstName,
            "email":email_id,
            "nric":nric,
            "dob":dob,
            "mobile":mobile,
            "school":secSchool,
            "diet":dietSelected,
            "password":password,
            "statuses_id":status,
            "method":method
        ]
        print("Sign up method back ")
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                
                response in
                print("Request \(parameters)")
                print(response)
                if response.result.isSuccess{
                    if let json = response.result.value {
                        let result = json as? [String:AnyObject]
                        if result!["status"] as? Int == 200{
                            
                            let alert = UIAlertController(title: String(describing: result!["display_title"]!), message: String(describing: result!["display_message"]!), preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default , handler: { (success) in
                                let LoginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                                self.present(LoginVC, animated: true, completion: nil)
                            }) )
                            self.present(alert, animated: true, completion: nil)
                            
                        }else{
                            print("Error Signing please contact the App provider.")
                            return
                        }
                    }
                }
        }
    }
    
    @IBAction func termsAggrement(_ sender: UIButton) {
        if terms == true{
            terms = false
            termsCheckBox.setImage(#imageLiteral(resourceName: "tick"), for: .normal)
        }else{
            terms = true
            termsCheckBox.setImage(nil, for: .normal)
        }
    }
    
    func getStudentDetails(){
        print("getStudentsDetails ")
        if !txtFirstName.text!.isEmpty{
            firstName = txtFirstName.text!
        }else{
            alertMessage(alertTitle: "Name", alertMessage: "Name cannot be empty")
        }
        
        /*if !txtEmail.text!.isEmpty{
            email_id = txtEmail.text!
        }else{
            alertMessage(alertTitle: "Email", alertMessage: "Email cannot be empty")
        }*/
        
        if !txtnric.text!.isEmpty{
            nric = txtnric.text!
        }else{
            alertMessage(alertTitle: "NRIC", alertMessage: "NRIC cannot be empty")
        }
        if !txtBirthDate.text!.isEmpty{
            //dob = txtBirthDate.text!
        }else{
            alertMessage(alertTitle: "Date of Birth", alertMessage: "Date of Birth cannot be empty")
        }
        
        if !txtContact.text!.isEmpty{
            mobile = txtContact.text!
        }else{
            alertMessage(alertTitle: "Contact Number", alertMessage: "Contact Number cannot be empty.")
        }
        
        if !txtSecSchool.text!.isEmpty{
            secSchool = txtSecSchool.text!
        }else{
            alertMessage(alertTitle: "Secondary School", alertMessage: "Secondary School cannot be empty.")
        }
        
        if !txtDietryReq.text!.isEmpty{
            dietSelected = txtDietryReq.text!
        }else{
            alertMessage(alertTitle: "Diet", alertMessage: "Please select diet.")
        }
        
        /*if txtPassword.text! != txtConfirmPassword.text!{
            alertMessage(alertTitle: "Password", alertMessage: "Password and Confirm Password doesn't match")
        }else{
            if !txtPassword.text!.isEmpty{
                password = txtPassword.text!
            }else{
                alertMessage(alertTitle: "Password", alertMessage: "Password cannot be empty.")
            }
        }*/
        
    }
    
    func alertMessage(alertTitle: String , alertMessage: String){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func backAction(_ sender: Any)
    {
        self.dismiss(animated:true, completion: nil)
    }
    
    //    @IBAction func savePickerValue(_ sender: Any)
    //    {
    //        txtDietryReq.resignFirstResponder()
    //        txtSecSchool.resignFirstResponder()
    //        print("Sender ::\(sender)")
    //        //self.removeAnimate()
    //    }
    
    
    //    @IBAction func cancelPickerSelection(_ sender: Any)
    //    {
    //        //self.removeAnimate()
    //    }
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        self.activeField = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == self.txtDietryReq
        {
            txtDietryReq.becomeFirstResponder()
            pickerTag = "diet"
            print("PICKER View :\(pickerTag)")
            //self.showAnimate()
        }
        else if textField == self.txtSecSchool
        {
            txtSecSchool.becomeFirstResponder()
            pickerTag = "school"
            print("PICKER View :\(pickerTag)")
            // self.showAnimate()
        }
        else
        {
            pickerTag = ""
            self.activeField = textField
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        switch textField
        {
        case txtFirstName:
            txtnric.becomeFirstResponder()
            break
        case txtnric:
            txtBirthDate.becomeFirstResponder()
            break
        case txtBirthDate:
            txtContact.resignFirstResponder()
            break
        case txtDietryReq:
            txtDietryReq.endEditing(true)
            return false
        case txtSecSchool:
            txtSecSchool.becomeFirstResponder()
            self.view.endEditing(true)
        default:
            return true
        }
        //self.view.endEditing(true)
        return true
    }
    
    //    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    //    {
    //        //txtViewContent.setContentOffset(textField.bounds.origin, animated: true)
    //        return true
    //    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        if (pickerTag == "diet"){
            return diet.count
        }else if (pickerTag == "school"){
            return school.count
        }else{
            return diet.count
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (pickerTag == "diet"){
            return diet[row]
        }else if (pickerTag == "school"){
            return school[row]
        }else{
            return diet[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerTag == "diet"){
            txtDietryReq.text = diet[row]
        }else if (pickerTag == "school"){
            txtSecSchool.text = school[row]
        }else{
            print("Empty")
        }
    }
}
