//
//  ParseNews.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/3/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import Foundation

protocol NewsStore {
    func getNews(_ news: String, listLinkNews: [String])
}

class ParseNews {
    
    var contributorsUrl: URL?
    var checkTagA = false
    var thongBao = ""
    var listLink: [String] = []
    var newsStoreDelegate: NewsStore?
    
    init(url: String) {
        self.contributorsUrl = URL(string: url)!
    }
    
    init() {
        self.contributorsUrl = nil
    }
    
    func setURL(_ url: String) {
        self.contributorsUrl = URL(string: url)
    }
    
    func loadNewsOnDaoTao(_ datePicked: String, nextDate: String, titlePicked: String, nextTitle: String) {
        if self.contributorsUrl != nil {
            let contributorsHtmlData = try? Data(contentsOf: contributorsUrl!)
            let contributorsParser = TFHpple(htmlData: contributorsHtmlData)
            let contributorsXpathQueryString: String = "//body"
            let contributorsNodes: Array = contributorsParser!.search(withXPathQuery: contributorsXpathQueryString)
            var check = false
            for element in contributorsNodes {
                for i in (element as! TFHppleElement).children {
                    if (i as! TFHppleElement).tagName == "p" && (i as! TFHppleElement).attributes["class"] != nil {
                        if (i as! TFHppleElement).firstChild.firstChild.firstChild.content == datePicked && check == false && (((i as! TFHppleElement).children[1] as! TFHppleElement).children[1] as! TFHppleElement).firstChild.content == titlePicked{
                            check = true
                            continue
                        }else if (i as! TFHppleElement).firstChild.firstChild.firstChild.content == nextDate && check == true && (((i as! TFHppleElement).children[1] as! TFHppleElement).children[1] as! TFHppleElement).firstChild.content == nextTitle {
                            check = false
                            break
                        }
                    }
                    if check == true {
                        loadChild(i as! TFHppleElement)
                    }
                }
            }
        }
        newsStoreDelegate?.getNews(self.thongBao, listLinkNews: self.listLink)
    }
    
    fileprivate func loadChild(_ element: TFHppleElement) {
//        print(element.tagName)
        if element.tagName == "a" {
            checkTagA = true
        }
        if element.children.count == 0 && element.content != nil {
            thongBao = thongBao + element.content
            if checkTagA == true {
                thongBao = thongBao + " Link"
                checkTagA = false
            }
//            print(element.content)
        }else {
            for i in element.children {
                if element.tagName == "a" {
//                    print(element.attributes["href"]!)
                    self.listLink.append(element.attributes["href"]! as! String)
                }
                loadChild(i as! TFHppleElement)
            }
        }
    }
    
}
