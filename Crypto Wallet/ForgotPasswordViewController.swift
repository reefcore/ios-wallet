//
//  ForgotPasswordViewController.swift
//  Crypto Wallet
//
//  Created by Anindya on 3/7/18.
//  Copyright © 2018 Setup Technology. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    // Back to previous controller
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Action to send code into Email
    @IBAction func sendNowAction(_ sender: Any) {
        // Code goes here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Change status bar style
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent // while coor
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
