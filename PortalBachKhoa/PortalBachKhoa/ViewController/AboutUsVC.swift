//
//  AboutUsVC.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/4/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit
import StoreKit
import MessageUI

class AboutUsVC: UITableViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let barButton = UIButton(frame: CGRect(x: 0,y: 0,width: 20,height: 20))
        barButton.setImage(UIImage(named: "toggle"), for: UIControlState())
        barButton.addTarget(self, action: #selector(self.clickToggle), for: .touchUpInside)
        let barItemButton = UIBarButtonItem(customView: barButton)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setLeftBarButton(barItemButton, animated: true)
        self.navigationItem.title = "About us"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 2
        }else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                UIApplication.shared.openURL(URL(string: Constant.kLINK_OURWEB)!)
            }else {
                UIApplication.shared.openURL(URL(string: Constant.kLINK_ITURN)!)
            }
        case 1:
            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
        default:
            let message = "iTube - Free Multimedia App for Youtube \n \(Constant.kLINK_ITURN)"
            let shareItems = [message]
            let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
    }

    func clickToggle() {
        toggleSideMenuView()
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["danh12t4@gmail.com"])
        mailComposerVC.setSubject("Feedback for iTube app")
        mailComposerVC.setMessageBody("\n", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        sendMailErrorAlert.addAction(okButton)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}
