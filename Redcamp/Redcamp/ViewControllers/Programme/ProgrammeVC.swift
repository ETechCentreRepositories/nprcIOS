//
//  ProgrammeVC.swift
//  Redcamp
//
//  Created by Abhijit on 14/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class ProgrammeVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{

    @IBOutlet weak var segDays: UISegmentedControl!
    @IBOutlet weak var tblProgramme: UITableView!
    
    let arrScheduleDay1 = ["08.30am Registration","09.00am Event Opening","10.00am Path of Discovery 1","01.00pm Lunch","02.30pm Path of Discovery 2","05.30pm Course % Admission Talk","06.00pm Mass Dance", "07.00pm End of Day 1"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tblProgramme.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
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
    @IBAction func changeProgramme(_ sender: UISegmentedControl)
    {
        
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "20 NOVEMBER TUESDAY"
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return arrScheduleDay1.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            cell!.backgroundColor = UIColor.white
            cell!.textLabel?.textColor = UIColor.darkGray
            cell!.textLabel?.font = UIFont.systemFont(ofSize: 12.0)
        }
        
        cell!.textLabel?.text = arrScheduleDay1[indexPath.row]
        
        return cell!
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 18.0
    }
    
}
