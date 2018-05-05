//
//  SettingsViewController.swift
//  Crypto Wallet
//
//  Created by Anindya on 3/15/18.
//  Copyright © 2018 Setup Technology. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var menuButton: UIButton!
    @IBOutlet var notificationSwitch: UIButton!
    @IBOutlet var basicInfoView: UIView!
    @IBOutlet var credentialInfoView: UIView!
    @IBOutlet var authenticationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            // self.revealViewController().rearViewRevealWidth=320
        }
        notificationSwitch.isSelected=true
        notificationSwitch.setImage(UIImage(named:"SwitchOnIcon"), for:.selected)
        notificationSwitch.setImage(UIImage(named:"SwitchOffIcon"), for:.normal)
        
        notificationSwitch.layer.cornerRadius=notificationSwitch.layer.frame.height/2.0
        notificationSwitch.clipsToBounds=true
        
        // Round corner for basicInfoView's TopRight and TopLeft
        
        let basicInfoViewPath = UIBezierPath(roundedRect:basicInfoView.bounds,
                                          byRoundingCorners:[.topRight, .topLeft],
                                          cornerRadii: CGSize(width: 10, height:  10))
        
        let basicInfoViewMaskLayer = CAShapeLayer()
        basicInfoViewMaskLayer.path = basicInfoViewPath.cgPath
        basicInfoView.layer.mask = basicInfoViewMaskLayer
        
        // Round corner for CredentialInfoView's TopRight and TopLeft
        
        let credentialInfoViewPath = UIBezierPath(roundedRect:credentialInfoView.bounds,
                                             byRoundingCorners:[.topRight, .topLeft],
                                             cornerRadii: CGSize(width: 10, height:  10))
        
        let credentialInfoViewMaskLayer = CAShapeLayer()
        credentialInfoViewMaskLayer.path = credentialInfoViewPath.cgPath
        credentialInfoView.layer.mask = credentialInfoViewMaskLayer
        
        // Round corner for authenticationView's TopRight and TopLeft
        
        let authenticationViewPath = UIBezierPath(roundedRect:authenticationView.bounds,
                                                  byRoundingCorners:[.topRight, .topLeft],
                                                  cornerRadii: CGSize(width: 10, height:  10))
        
        let authenticationViewMaskLayer = CAShapeLayer()
        authenticationViewMaskLayer.path = authenticationViewPath.cgPath
        authenticationView.layer.mask = authenticationViewMaskLayer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Change the status bar style / color
    
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

}
