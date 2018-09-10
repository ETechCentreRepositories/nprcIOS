//
//  ParentConsentController.swift
//  Redcamp
//
//  Created by Gunjan Pathak on 4/9/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class ParentConsentController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{


    @IBOutlet weak var relation: UIPickerView!
    @IBOutlet weak var parentRelationshipInput: UITextField!
    @IBOutlet weak var parentRelationship: UITextField!
    @IBOutlet weak var parentMobile: UITextField!
    @IBOutlet weak var parentName: UITextField!
    
    
    var myPickerView = UIPickerView()
    var relationList = ["Father", "Mother", "Sister","Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func test(_ sender: Any) {
        let image = generateQRCode(from: "stringtesting ")
        
        
        
        let alert =  UIAlertController(title: "Thank you for completing parent consent form! Here are your e-ticket to RED Camp!", message: "QR code are Unique and tagged to each individual camper so don't share! You will need your own! ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        
        alert.addImage(image: image!)
        
        self.present(alert, animated: true,completion: nil)
        
    }
    func pickUp(_ textField : UITextField){
        
        // UIPickerView
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        textField.inputView = self.myPickerView
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return relationList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return relationList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.parentRelationship.text = relationList[row]
    }
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUp(parentRelationship)
    }
    
    @objc func doneClick() {
        parentRelationship.resignFirstResponder()
    }
    @objc func cancelClick() {
        parentRelationship.resignFirstResponder()
    }

//QRCODE
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
    
    
    
//    func textFieldDidBeginEditing(_ textField: UITextField)
//    {
//        if textField == self.parentRelationship
//        {
//            parentRelationship.becomeFirstResponder()
//            thePicker.reloadAllComponents()
//            //self.showAnimate()
//        }
//    }
//
    
//    func createPickerView()
//    {
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(savePressed))
//        toolbar.setItems([doneButton], animated: false)
//
//        parentRelationship.inputAccessoryView = toolbar
//        parentRelationship.inputView = thePicker
//
//        //txtSecSchool.inputAccessoryView = toolbar
//        //txtSecSchool.inputView = thePicker
//    }
//
//    @objc func savePressed()
//    {
//        parentRelationship.resignFirstResponder()
//    }
//
//
//    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
//        return 1
//    }
//
//    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
//
//        return list.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        self.view.endEditing(true)
//        return list[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//        self.parentRelationship.text = self.list[row]
//        self.relation.isHidden = true
//    }
//
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
