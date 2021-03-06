//
//  HomeVC.swift
//  Redcamp
//
//  Created by Abhijit on 9/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class HomeVC: UIViewController,ENSideMenuDelegate,UICollectionViewDelegate,UICollectionViewDataSource
{

   
    @IBOutlet weak var colHome: UICollectionView!
    @IBOutlet weak var viewScrollContent: UIView!
    @IBOutlet weak var lblProfileName: UILabel!
    
    var arrTitle = ["CAMP PROGRAMME","COURSE FINDER","CAMPUS EXPLORER","ASK RED CAMP"]
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewWillAppear(_ animated: Bool)
    {
                
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/2, height: screenHeight/3.8)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        colHome!.collectionViewLayout = layout
        
        if let name = UserDefaults.standard.string(forKey: "name")
        {
            let arrNames = name.split(separator: " ")
            self.lblProfileName.text = "Hello " + arrNames[0] + "!"
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showMenu(_ sender: Any)
    {
        toggleSideMenuView()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        // text to share
        let text = "I'm in for the MOST LIT Camp for O-levelers!\nJoin me at RED CAMP 15!\n\nDownload the RED CAMP App now to register!\nhttps://www.np.edu.sg/redcamp/Pages/default.aspx#register"
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook, UIActivityType.message,UIActivityType.postToTwitter ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)

        
    }
    /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
     {
     let size = CGSize(width: collectionView.bounds.size.width/3 - 10, height: collectionView.bounds.size.height/3 - 10)
     return size
     }*/
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if let homeCell = cell as? HomeColCell
        {
            cell.backgroundColor = UIColor.black
            
            if (indexPath.row == 0)
            {
                homeCell.imgBackGround.image = UIImage(named: "campporgramme.png")
            }
            if (indexPath.row == 1)
            {
                homeCell.imgBackGround.image = UIImage(named: "pathofdiscovery.png")
            }
            if (indexPath.row == 2)
            {
                homeCell.imgBackGround.image = UIImage(named: "campusexplorer.png")
                
            }
            if (indexPath.row == 3)
            {
                homeCell.imgBackGround.image = UIImage(named: "askredcamp.png")
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeColCell", for: indexPath) as! HomeColCell
        
        cell.contentView.backgroundColor = UIColor.black
        if (indexPath.row == 0)
        {
            cell.lblTitle.text = arrTitle[indexPath.row]
            return cell
        }
        if (indexPath.row == 1)
        {
            cell.lblTitle.text = arrTitle[indexPath.row]
            return cell
        }
        if (indexPath.row == 2)
        {
            cell.lblTitle.text = arrTitle[indexPath.row]
            return cell
            
        }
        if (indexPath.row == 3)
        {
            cell.lblTitle.text = arrTitle[indexPath.row]
            return cell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if indexPath.row == 0
        {
            let pagingVC = self.storyboard?.instantiateViewController(withIdentifier: "ProgrammeVC") as! ProgrammeVC
            
            self.navigationController?.pushViewController(pagingVC, animated: true)
        }
        else
        {
            let webVC = self.storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
            
            switch indexPath.row
            {
            case 1:
                webVC.currentURL = "https://www.np.edu.sg/Pages/diplomas.aspx"
                break
            case 2:
                webVC.currentURL = "https://www.np.edu.sg/pages/tour.aspx"
                break
            case 3:
                webVC.currentURL = "https://www.np.edu.sg/redcamp/pages/askredcamp.aspx"
                break
            default:
                webVC.currentURL = "https://www.np.edu.sg/redcamp/pages/askredcamp.aspx"
            }
            
            self.present(webVC, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
        
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
        //isMenuOpen = false
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
        //isMenuOpen = true
    }
    
}
