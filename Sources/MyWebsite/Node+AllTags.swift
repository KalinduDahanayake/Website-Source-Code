//
//  File.swift
//
//
//  Created by Kalindu Dahanyake on 10/10/21.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    
    static func AllTags<T: Website>(for items: [Item<T>], on site: T) -> Node {
        var everyTag = [Tag]()
        // access each post's tags and append to an array of tags
        items.forEach { item in
            item.tags.forEach { subItem in
                everyTag.append(subItem)
            }
        }
        // removes repeated tags
        let uniqueTags = Array(Set(everyTag))
        return
            .div(
                .h1("All tags"),
                    .tagList(for: uniqueTags, on: site)
                
            )
    }
}
