//
//  MainVC.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/1/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class MainVC: UIViewController, UIGestureRecognizerDelegate,  ENSideMenuDelegate, LinkASPStore {
    
    @IBOutlet weak var imgView: UIImageView!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var singleTap: UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.hidden = true
        
        singleTap = UITapGestureRecognizer(target: self, action: #selector(self.toggleSideMenu))
        singleTap.delegate = self
        singleTap.numberOfTapsRequired = 1
        
        self.view.addGestureRecognizer(singleTap)
        
        let parseLink = ParseTitle(url: Constant.kLINK_DAOTAO)
        parseLink.linkASPStoreDelegate = self
        parseLink.loadTitleOnDaoTao()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //#MARK: - Selector
    
    func toggleSideMenu() {
        toggleSideMenuView()
    }
    
    //#MARK: - Delegate Define
    
    func getListLinkAPS(listLink: [String]) {
        self.appDelegate.listLinkASP = listLink
    }

}
