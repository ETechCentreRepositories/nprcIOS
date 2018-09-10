//
//  SideMenuVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 12/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func makeRounded() {
        let radius = self.frame.width/2.0
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}


class SideMenuVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{

 
    @IBOutlet weak var tblSideMenu: UITableView!
    @IBOutlet weak var lblProfileName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    var selectedMenuItem : Int = 0
    
    let arrSideMenuTitle = ["STRENGTH","ENERGY","XP"]
    var arrSideMenuSubTitle = ["alincelee@gmail.com","+65 9999 8888","01 March 2010"]
    
    let arrSideMenuIcons = ["Spartens@3x.png"]
    
    let arrOthers        = ["Share","Invite"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        self.imgProfile.makeRounded()
        
        if let name = UserDefaults.standard.string(forKey: "name")
        {
            self.lblProfileName.text = name
        }
        
        // Preserve selection between presentations
        self.tblSideMenu.clearsContextBeforeDrawing = true
        tblSideMenu.selectRow(at: IndexPath(row: selectedMenuItem, section: 0), animated: false, scrollPosition: .middle)
        tblSideMenu.tableFooterView = UIView()
        tblSideMenu.backgroundColor = UIColor.darkGray
        imgProfile.layer.borderWidth = 0.1
        imgProfile.layer.masksToBounds = false
        imgProfile.layer.borderColor = UIColor.black.cgColor
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
        imgProfile.clipsToBounds = true
        
        let frame = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 10.0)
        let slider = UISlider(frame: frame)
        slider.backgroundColor = UIColor.clear
        slider.minimumValue = 0.0
        slider.maximumValue = 50.0
        slider.isContinuous = true
        slider.value = 25.0
        view.addSubview(slider)
        
        self.arrSideMenuSubTitle.removeAll()
        
        if let email = UserDefaults.standard.string(forKey: "email")
        {
            self.arrSideMenuSubTitle.append(email)
        }
        if let mobile = UserDefaults.standard.string(forKey: "mobile")
        {
            self.arrSideMenuSubTitle.append(mobile)
        }
        if let dob = UserDefaults.standard.string(forKey: "dob")
        {
            self.arrSideMenuSubTitle.append(dob)
        }
        if arrSideMenuSubTitle.count < 3
        {
            arrSideMenuSubTitle = ["","",""]
        }
        self.tblSideMenu.reloadData()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func showProfile(_ sender: Any)
    {
//         let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
//         var destViewController : UIViewController
//         destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileVC")
//         sideMenuController()?.setContentViewController(destViewController)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50//44.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrSideMenuTitle.count + 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 3
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuCell
            cell.contentView.backgroundColor = UIColor.darkGray
            cell.imgIcon.image = #imageLiteral(resourceName: "notification")
            cell.lblTitle.text = "Notification"
            return cell
        }else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuCell
            cell.contentView.backgroundColor = UIColor.darkGray
            cell.imgIcon.image = #imageLiteral(resourceName: "parentconcern")
            cell.lblTitle.text = "Parent Concern"
            return cell
        }else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuCell
            cell.contentView.backgroundColor = UIColor.darkGray
            cell.imgIcon.image = #imageLiteral(resourceName: "todayspoll")
            cell.lblTitle.text = "Today's Poll"
            return cell
        }else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuCell
            cell.contentView.backgroundColor = UIColor.darkGray
            cell.imgIcon.image = #imageLiteral(resourceName: "QRCode")
            cell.lblTitle.text = "My QR Code"
            return cell
        }else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuCell
            cell.contentView.backgroundColor = UIColor.darkGray
            cell.imgIcon.image = UIImage(named: "logout.png")
            cell.lblTitle.text = "Logout"
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCellText", for: indexPath) as! SideMenuCellText
            
            cell.lblTitle.text = arrSideMenuTitle[indexPath.row]
            cell.lblSubTitle.text = arrSideMenuSubTitle[indexPath.row]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if (indexPath.row == 3){
            let alert = UIAlertController(title: "Notification", message: "This feature will be available once the camp starts.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if (indexPath.row == 4){
            let alert = UIAlertController(title: "Parent Concern", message: "The Parent Consent Form will be available at a later date.\n\n You will receive a notification to get it signed in order to receive your QR code e-ticket to RED Camp", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if (indexPath.row == 5){
            let alert = UIAlertController(title: "Today's Poll", message: "Check back here at RED Camp Day 1!\nPoll Questions will be available during RED Camp.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if (indexPath.row == 6)
        {
            let alert = UIAlertController(title: "My QR Code", message: "Receive your QR code e-ticket to RED Camp when you get the Parent Consent Form signed!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if (indexPath.row == 7)
        {
            UserDefaults.standard.set("0", forKey: "loginStatus")
            UserDefaults.standard.synchronize()
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
    }
    
}
