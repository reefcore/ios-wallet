//
//  SendConfirmationViewController.swift
//  Crypto Wallet
//
//  Created by Anindya on 3/15/18.
//  Copyright © 2018 Setup Technology. All rights reserved.
//

import UIKit

class SendConfirmationViewController: UIViewController {

    @IBOutlet var bottomView: UIView!
    @IBOutlet var confirmButton: UIButton!
    @IBOutlet var goBackButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Make round corner
        goBackButton.layer.cornerRadius=2.0
        goBackButton.clipsToBounds=true
        
        // Make round corner
        confirmButton.layer.cornerRadius=2.0
        confirmButton.clipsToBounds=true
        
        // Make round corner for top-left and top-right for BottomView
        let bottomViewPath = UIBezierPath(roundedRect:bottomView.bounds,
                                byRoundingCorners:[.topRight, .topLeft],
                                cornerRadii: CGSize(width: 20, height:  20))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = bottomViewPath.cgPath
        bottomView.layer.mask = maskLayer
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Change status bar style/ color
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    // Back to previous controller
    @IBAction func goBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Confrim action to complete the transaction
    @IBAction func confirmButtonAction(_ sender: Any) {
        // Submission code goes here
    }
    
}
