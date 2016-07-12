//
//  NewsScrollVC.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/3/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class NewsScrollVC: UIViewController, NewsStore {
    
    @IBOutlet weak var btnLink: UIButton!
    @IBOutlet weak var lblNews: UILabel!
    @IBOutlet weak var viewScroll: UIView!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var alert: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        let parseNews = ParseNews(url: self.appDelegate.currentLink)
        parseNews.newsStoreDelegate = self
        parseNews.loadNewsOnDaoTao(self.appDelegate.currentDate, nextDate: self.appDelegate.nextDate, titlePicked: self.appDelegate.currentTitle, nextTitle: self.appDelegate.nextTitle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //#MARK: - Define Store
    
    func getNews(news: String, listLinkNews: [String]) {
        if listLinkNews.count == 0 {
            self.btnLink.enabled = false
            self.btnLink.backgroundColor = UIColor.lightGrayColor()
        }else {
            self.btnLink.enabled = true
            alert = UIAlertController(title: "Link", message: nil, preferredStyle: .ActionSheet)
            for i in 0..<listLinkNews.count {
                let linkBtn = UIAlertAction(title: "Link \(i+1)", style: .Default, handler: { (action) in
                    let url = listLinkNews[i].stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
                    UIApplication.sharedApplication().openURL(NSURL(string: url!)!)
                })
                alert!.addAction(linkBtn)
            }
            let cancelBtn = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
            alert!.addAction(cancelBtn)
        }
        self.lblNews.text = news
        if self.lblNews.bounds.height + self.lblNews.frame.origin.y > self.viewScroll.bounds.height {
            self.viewScroll.frame.size.height =  self.lblNews.bounds.height + self.lblNews.frame.origin.y
        }
        print(self.viewScroll.bounds.height)
        print(self.lblNews.bounds.height)
    }
    
    //#MARK: - Define Handle
    
    @IBAction func clickedBtnLink(sender: AnyObject) {
        self.presentViewController(alert!, animated: true, completion: nil)
    }

}
