//
//  SideMenuViewController.swift
//  Crypto Wallet
//
//  Created by Anindya on 3/16/18.
//  Copyright © 2018 Setup Technology. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var profileButton: UIButton!
    @IBOutlet var settingButton: UIButton!
    @IBOutlet var activityTableView: UITableView!
    
    @IBOutlet var walletTableView: UITableView!
    @IBOutlet var logOutButton: UIButton!
    
    // Table's identifier
    let activityIdentifier="activityCell"
    let walletIdentifier="walletCell"
    
    let activityData=["Transaction","Receive","Send"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make round profile Button
        self.profileButton.layer.cornerRadius=self.profileButton.layer.frame.height/2.0
        profileButton.clipsToBounds=true
        
        // Make round setting Button
        self.settingButton.layer.cornerRadius=self.settingButton.layer.frame.height/2.0
        settingButton.clipsToBounds=true
        
        // Make round corner for Log out Button
        logOutButton.layer.cornerRadius=3.0
        logOutButton.clipsToBounds=true
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Change status bar style
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // No. of section in tableview
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView==activityTableView {
            return activityData.count // No. of rows in a section
        }else{
            return 2 // Change the number for more row
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50;// Set row height
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView==self.activityTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier:activityIdentifier )
            cell?.selectionStyle=UITableViewCellSelectionStyle.none
            cell?.backgroundColor = .clear
            let activityImageView=cell?.viewWithTag(1) as! UIImageView
            let activityLabel=cell?.viewWithTag(2) as! UILabel
            if indexPath.row==0{
                activityImageView.image=UIImage(named:"MenuTransactionIcon")
                activityLabel.text=activityData[indexPath.row]
            }else if indexPath.row==1{
                activityImageView.image=UIImage(named:"MenuReceiveIcon")
                activityLabel.text=activityData[indexPath.row]
            }else{
                activityImageView.image=UIImage(named:"MenuSendIcon")
                activityLabel.text=activityData[indexPath.row]
            }
            
            // Set custom separator between rows
            let seperatorView = UIView()
            seperatorView.backgroundColor=UIColor.white
            seperatorView.frame=CGRect(x: 0, y: (cell?.contentView.frame.size.height)!+3.0, width: (cell?.frame.size.width)!, height: 3.0)
            cell?.contentView.addSubview(seperatorView)
            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier:walletIdentifier )
            cell?.selectionStyle=UITableViewCellSelectionStyle.none
            cell?.backgroundColor = .clear
            let walletImageView=cell?.viewWithTag(1) as! UIImageView
            let walletLabel=cell?.viewWithTag(2) as! UILabel
            if indexPath.row==0{
                walletImageView.image=UIImage(named:"MenuWalletIcon")
                walletLabel.text="Bitcoin Wallet"
            }else{
                walletImageView.image=UIImage(named:"MenuAddWalletIcon")
                walletLabel.text="Add Wallet"
            }
            
            // Set custom separator between rows
            let seperatorView = UIView()
            seperatorView.backgroundColor=UIColor.white
            seperatorView.frame=CGRect(x: 0, y: (cell?.contentView.frame.size.height)!+3.0, width: (cell?.frame.size.width)!, height: 3.0)
            cell?.contentView.addSubview(seperatorView)
            return cell!
        }
        
    }
    
}
