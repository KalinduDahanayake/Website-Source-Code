//
//  File.swift
//  
//
//  Created by Kalindu Dahanyake on 2/11/21.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    
    static func Ongoing<T: Website>(for items: [Item<T>], on site: T) -> Node {
        var everyTag = [Tag]()
        // access each post's tags and append to an array of tags
        items.forEach { item in
            item.tags.forEach { subItem in
                if (subItem.string == "ongoing") {
                    everyTag.append(subItem)
                }
            }
        }
        // removes repeated tags
        let uniqueTags = Array(Set(everyTag))
        //uniqueTags = uniqueTags.sorted { $0.string < $1.string }
        return
            .div(
                .class("padding"),
                .tagList(for: uniqueTags, on: site)
            )
    }
}
