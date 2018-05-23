//
//  WelcomeVC.swift
//  Redcamp
//
//  Created by Abhijit on 14/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var btnLetsgo: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        btnLetsgo.layer.cornerRadius = 10
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func performLetsGo(_ sender: Any)
    {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        
        self.view.window?.rootViewController = loginVC
        self.view?.window?.makeKeyAndVisible()
        self.present(loginVC, animated: true, completion: nil)
        
        
    }
    
}
