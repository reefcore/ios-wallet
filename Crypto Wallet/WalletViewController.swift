//
//  WalletViewController.swift
//  Crypto Wallet
//
//  Created by Anindya on 3/14/18.
//  Copyright © 2018 Setup Technology. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var menuButton: UIButton!
    @IBOutlet var receiveSelectorButton: UIButton!
    @IBOutlet var transactionSelectorButton: UIButton!
    @IBOutlet var sendSelectorButton: UIButton!
    
    // Receive view
    @IBOutlet var receiveView: UIView!
    @IBOutlet var qrCodeImageView: UIImageView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var requestAmountButton: UIButton!
    
    // Transaction View
    @IBOutlet var transactionView: UIView!
    @IBOutlet var receivedButton: UIButton!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var transactionTableView: UITableView!
    @IBOutlet var transactionBottomView: UIView!
    
    // Send View
    @IBOutlet var sendView: UIView!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var notesTextField: UITextField!
    @IBOutlet var sendNowButton: UIButton!
    @IBOutlet var sendBottomView: UIView!
    
    // Declare Identifier
    let transactionIdentifier="transactionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
         
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
           // self.revealViewController().rearViewRevealWidth=320
        }
        
        // Default selected view
        transactionSelectorButton.isSelected=true
        receiveView.isHidden=true;
        transactionView.isHidden=false
        sendView.isHidden=true
        
        // RECEIVE VIEW
        
        // Set state for Receive selector button
        receiveSelectorButton .setImage(UIImage(named:"ReceiveNormalIcon"), for: UIControlState.normal)
        receiveSelectorButton .setImage(UIImage(named:"ReceiveSelectIcon"), for: UIControlState.selected)
      
        // Generate QR Code
        qrCodeImageView.image=createQRFromAddress(addressLabel.text!)
        requestAmountButton.layer.cornerRadius=2.0
        requestAmountButton.clipsToBounds=true
        
        // TRANSACTION VIEW
        
        // Set state for Transaction selector button
        transactionSelectorButton .setImage(UIImage(named:"TransactionNormalIcon"), for: UIControlState.normal)
        transactionSelectorButton .setImage(UIImage(named:"TransactionSelectIcon"), for: UIControlState.selected)
        
        // Receive button state
        receivedButton.setImage(UIImage(named:"TransReceiveNormalIcon"), for: UIControlState.normal)
                receivedButton.setImage(UIImage(named:"TransReceiveSelectIcon"), for: UIControlState.selected)
        
        // Send Button state
        sendButton.setImage(UIImage(named:"TransSendNormalIcon"), for: UIControlState.normal)
        sendButton.setImage(UIImage(named:"TransSendSelectIcon"), for: UIControlState.selected)
        
        // Round corner for transactionBottomView's TopRight and TopLeft
        let transactionBottomViewPath = UIBezierPath(roundedRect:transactionBottomView.bounds,
                                                  byRoundingCorners:[.topRight, .topLeft],
                                                  cornerRadii: CGSize(width: 20, height:  10))
        
        let transactionBottomViewMaskLayer = CAShapeLayer()
        transactionBottomViewMaskLayer.path = transactionBottomViewPath.cgPath
        transactionBottomView.layer.mask = transactionBottomViewMaskLayer
        
        // Set tableview delegate methods
        transactionTableView.delegate=self
        transactionTableView.dataSource=self
        
        // Clear Table's background color
        transactionTableView.backgroundColor = .clear
        receivedButton.isSelected=true
        
        // SEND VIEW
        
        // Set state for Send selector button
        sendSelectorButton .setImage(UIImage(named:"SendNormalIcon"), for: UIControlState.normal)
        sendSelectorButton .setImage(UIImage(named:"SendSelectIcon"), for: UIControlState.selected)
        
        // Make round corner for Send Now Button
        sendNowButton.layer.cornerRadius=2.0
        sendNowButton.clipsToBounds=true
        
        // set custom placeholder color for address textfield
        addressTextField.attributedPlaceholder=NSAttributedString(string: "Bitcoin Address", attributes: [NSAttributedStringKey.foregroundColor :UIColor.lightGray])
        
        // set custom placeholder color for amount textfield
        amountTextField.attributedPlaceholder=NSAttributedString(string: "Amount", attributes: [NSAttributedStringKey.foregroundColor:UIColor.lightGray])
        
        //set custom placeholder color for Notes textfield
        notesTextField.attributedPlaceholder=NSAttributedString(string: "Notes", attributes: [NSAttributedStringKey.foregroundColor:UIColor.lightGray])
        
        // Round corner for sendBottomView's TopRight and TopLeft
        let sendBottomViewPath = UIBezierPath(roundedRect:sendBottomView.bounds,
                                             byRoundingCorners:[.topRight, .topLeft],
                                             cornerRadii: CGSize(width: 20, height:  10))
        
        let sendbottomViewMaskLayer = CAShapeLayer()
        sendbottomViewMaskLayer.path = sendBottomViewPath.cgPath
        sendBottomView.layer.mask = sendbottomViewMaskLayer
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Change status bar style/color
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }

    // Generate QRCode from addresss
    
    func createQRFromAddress(_ address: String)->UIImage! {
        var qrcodeImage: CIImage!
        let data = address.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        
        qrcodeImage = filter?.outputImage
        let scaleX = qrCodeImageView.frame.size.width / qrcodeImage.extent.size.width
        let scaleY = qrCodeImageView.frame.size.height / qrcodeImage.extent.size.height
        
        let transformedImage = qrcodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
        return UIImage(ciImage:transformedImage)
        
    }
    

    
    // MARK: - UITableView Delegate methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // No. of section in tableview
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // No. of rows in a section
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50;// Set row height
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:transactionIdentifier )
        cell?.selectionStyle=UITableViewCellSelectionStyle.none
        cell?.backgroundColor = .clear
        let paymentImageView=cell?.viewWithTag(1) as! UIImageView
        let paymentLabel=cell?.viewWithTag(2) as! UILabel
        if receivedButton.isSelected {
            paymentLabel.text="Payment Received"
            paymentImageView.image=UIImage(named:"PaymentReceivedIcon")
        }else{
            paymentLabel.text="Payment Send"
            paymentImageView.image=UIImage(named:"PaymentSendIcon")
        }
        return cell!
    }
    
    // Top buttons action
    
    @IBAction func selectorsButtonAction(_ sender: UIButton) {
        switch sender.tag {
        case 101:
            //Set selector button status
            receiveSelectorButton.isSelected=true
            transactionSelectorButton.isSelected=false
            sendSelectorButton.isSelected=false
            
            // Show - Hide view
            
            receiveView.isHidden=false;
            transactionView.isHidden=true
            sendView.isHidden=true
            
            break
        case 102:
            //Set selector button status
            receiveSelectorButton.isSelected=false
            transactionSelectorButton.isSelected=true
            sendSelectorButton.isSelected=false
            
            // Show - Hide view
            
            receiveView.isHidden=true;
            transactionView.isHidden=false
            sendView.isHidden=true
            break
        default:
            //Set selector button status
            receiveSelectorButton.isSelected=false
            transactionSelectorButton.isSelected=false
            sendSelectorButton.isSelected=true
            
            // Show - Hide view
            
            receiveView.isHidden=true;
            transactionView.isHidden=true
            sendView.isHidden=false
        }
    }
    
    // Transaction Send & Received action
    @IBAction func transactionTypeAction(_ sender: UIButton) {
      // Select button's tag
        switch sender.tag {
        case 201:
            receivedButton.isSelected=true
            sendButton.isSelected=false;
            // Reload Tableview
            transactionTableView .reloadData()
        default:
            receivedButton.isSelected=false
            sendButton.isSelected=true;
            
            // Reload tableview
            transactionTableView.reloadData()
        }
    }
    
}
