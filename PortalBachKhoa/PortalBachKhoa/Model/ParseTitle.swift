//
//  ParseTitle.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/1/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import Foundation
import UIKit

protocol LinkASPStore {
    func getListLinkAPS(listLink: [String])
}

class ParseTitle {
    
    var contributorsUrl: NSURL?
    var linkASPStoreDelegate: LinkASPStore?
    
    init(url: String) {
        self.contributorsUrl = NSURL(string: url)!
    }
    
    init() {
        self.contributorsUrl = nil
    }
    
    func setURL(url: String) {
        self.contributorsUrl = NSURL(string: url)
    }
    
    func loadTitleOnDaoTao() {
        var listLinkASP: [String] = []
        if self.contributorsUrl != nil {
            let contributorsHtmlData = NSData(contentsOfURL: contributorsUrl!)
            let contributorsParser = TFHpple(HTMLData: contributorsHtmlData)
            let contributorsXpathQueryString: String = "//iframe"
            let contributorsNodes: Array = contributorsParser.searchWithXPathQuery(contributorsXpathQueryString)
            for element in contributorsNodes {
                listLinkASP.append((element as! TFHppleElement).attributes["src"]! as! String)
            }
            listLinkASP.removeLast()
            linkASPStoreDelegate?.getListLinkAPS(listLinkASP)
            
        }
    }
    
}