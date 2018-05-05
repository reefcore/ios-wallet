//
//  SignUpViewController.swift
//  Crypto Wallet
//
//  Created by Anindya on 3/7/18.
//  Copyright © 2018 Setup Technology. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // Back to previous controller
    @IBAction func backSignInAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Sign up action
    @IBAction func signUpAction(_ sender: Any) {
        // code goes here to call API
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Change status bar color/ style
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent // while color
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
