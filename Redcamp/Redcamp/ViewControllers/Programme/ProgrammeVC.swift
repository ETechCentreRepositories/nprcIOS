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
    
    var arrScheduleDay = [String]()
    
    let arrScheduleDay1 = ["08:30am Registration",
                           "09:00am Event Opening",
                           "10:00am Path of Discovery 1",
                           "01:00pm Lunch",
                           "02:30pm Path of Discovery 2",
                           "05:30pm Course & Admission Talk",
                           "06:00pm Mass Dance",
                           "06:30pm End of Day 1"]
    
    let arrScheduleDay2 = ["08:30am Registration",
                           "09:00am Skit Performance",
                           "10:00am Path of Discovery 3",
                           "01:00pm Lunch",
                           "02:30pm Path of Discovery 4",
                           "05:30pm CCA Fiesta",
                           "06:00pm Mass Dance",
                           "06:30pm End of Day 2"]
    
    let arrScheduleDay3 = ["08:30am Registration",
                           "09:00am Event Opening",
                           "10:00am Path of Discovery 5",
                           "01:00pm Lunch",
                           "02:30pm Camp Finale",
                           "06:00pm Dinner",
                           "07:30pm End of RED CAMP"]
    
    var day = 1
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tblProgramme.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        arrScheduleDay = arrScheduleDay1
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
        print("Sender : \(sender.selectedSegmentIndex)")
        if sender.selectedSegmentIndex == 0{
            arrScheduleDay = arrScheduleDay1
            day = 1
            tblProgramme.reloadData()
        }else if sender.selectedSegmentIndex == 1{
            arrScheduleDay = arrScheduleDay2
            day = 2
            tblProgramme.reloadData()
        }else if sender.selectedSegmentIndex == 2{
            arrScheduleDay = arrScheduleDay3
            day = 3
            tblProgramme.reloadData()
        }
        
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if day == 1
        {
            return " 20 NOVEMBER TUESDAY"
        }else if day == 2
        {
            return " 21 NOVEMBER WEDNESDAY"
        }else
        {
            return " 22 NOVEMBER THURSDAY"
        }
        //return "20 NOVEMBER TUESDAY"
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return arrScheduleDay.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            cell!.backgroundColor = UIColor.white
            cell!.textLabel?.textColor = UIColor.darkGray
            cell!.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
        }
        
        cell!.textLabel?.text = arrScheduleDay[indexPath.row]
        
        return cell!
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 18.0
    }
    
}
