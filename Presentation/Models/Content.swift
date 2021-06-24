//
//  Content.swift
//  Presentation
//
//  Created by Dmitry Kononchuk on 21.06.2021.
//  Copyright © 2021 Dmitry Kononchuk. All rights reserved.
//

struct Content {
    // MARK: - Public Properties
    let mainText: String
    let subText: String
    
    // MARK: - Public Methods
    static func getContent() -> [Content] {
        var contents: [Content] = []
        let data = DataManager.shared
        
        let mainTexts = data.mainPresentationText
        let subTexts = data.subPresentationText
        
        let iterationCount = min(mainTexts.count, subTexts.count)
        
        for index in 0 ..< iterationCount + 1 {
            if index == iterationCount {
                let content = Content(mainText: "", subText: "")
                contents.append(content)
            } else {
                let content = Content(
                    mainText: mainTexts[index],
                    subText: subTexts[index]
                )
                contents.append(content)
            }
        }
        return contents
    }
}
