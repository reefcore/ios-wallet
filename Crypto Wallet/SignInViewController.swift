//
//  SignInViewController.swift
//  Crypto Wallet
//
//  Created by Anindya on 3/7/18.
//  Copyright © 2018 Setup Technology. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Change status bar color
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // SignIn action to verify users and to navigate to dashboard
    
    @IBAction func signInAction(_ sender: Any) {
        
        // API Call goes here
        
        // Navigate to the Dashboard
        if  let swvc=self.storyboard?.instantiateViewController(withIdentifier:"SWReveal"){
            self.navigationController?.pushViewController(swvc, animated: true)
        }
       
    }
}
