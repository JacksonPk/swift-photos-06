//
//  WebImages.swift
//  PhotoApps
//
//  Created by Song on 2021/03/24.
//

import Foundation

class ImageInfoStorage {
    
    private var jsonTitle: String
    private var jsonData: [[String: Any]]?
    private(set) var infos: [ImageInfo]
    
    struct ImageInfo {
        private let title: String
        private let imageURL: String
        private let date: Date
        
        init(title: String, imageURL: String, date: Date) {
            self.title = title
            self.imageURL = imageURL
            self.date = date
        }
        
        enum Keys {
            static let title = "title"
            static let imageURL = "image"
            static let date = "date"
        }
    }
    
    init(jsonTitle: String) {
        self.jsonTitle = jsonTitle
        self.infos = []
        getJsonData()
        configureImageInfos()
    }
    
    private func getJsonData() {
        guard let jsonPath = Bundle.main.url(forResource: self.jsonTitle,
                                             withExtension: "json") else { return }
        do {
            let data = try String(contentsOf: jsonPath).data(using: .utf8)
            let json = try JSONSerialization.jsonObject(with: data!, options: [[]]) as? [[String: Any]]
            self.jsonData = json
        } catch {
            print(error)
        }
    }
    
    private func configureImageInfos() {
        guard let jsonData = self.jsonData else { return }
    
        jsonData.forEach({ (json) in
            let title = json[ImageInfo.Keys.title] as! String
            let imageURL = json[ImageInfo.Keys.imageURL] as! String
            let dateInString = json[ImageInfo.Keys.date] as! String
            let date = stringToDate(dateInString, withformat: "yyyyMMdd")
            
            let newInfo = ImageInfo(title: title,
                                    imageURL: imageURL,
                                    date: date)
            
            self.infos.append(newInfo)
        })
    }
    
    private func stringToDate(_ string: String, withformat format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let newDate = formatter.date(from: string) ?? Date()
        return newDate
    }
}
