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
    
    let arrSideMenuTitle = ["Email","Phone","Date Of Birth"]
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
         let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
         var destViewController : UIViewController
         destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileVC")
         sideMenuController()?.setContentViewController(destViewController)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrSideMenuTitle.count + 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 3
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuCell
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
        if (indexPath.row == 3)
        {
            self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
}
