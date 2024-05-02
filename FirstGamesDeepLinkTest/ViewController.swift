//
//  ViewController.swift
//  FirstGamesDeepLinkTest
//
//  Created by Sparsh on 02/05/24.
//

import UIKit
import OtplessSDK

class ViewController: UIViewController, onHeadlessResponseDelegate {
    @IBOutlet var tokenLabel: UILabel!
    
    func onHeadlessResponse(response: OtplessSDK.HeadlessResponse?) {
        if response?.statusCode == 200 {
            if let token = response?.responseData?["token"] as? String {
                tokenLabel.text = "Token - " + token
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Otpless.sharedInstance.headlessDelegate = self
        Otpless.sharedInstance.webviewInspectable = true
        Otpless.sharedInstance.initialise(vc: self, appId: "hk5bhpubbg7bry4ir7ir")
    }

    @IBAction func loginWithWhatsapp() {
        let request = HeadlessRequest()
        request.setChannelType(HeadlessChannelType.sharedInstance.WHATSAPP)
        Otpless.sharedInstance.startHeadless(headlessRequest: request)
    }
}

