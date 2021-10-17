//
//  File.swift
//
//
//  Created by Kalindu Dahanyake on 13/10/21.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    
    static func allTags<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return
            .div(
                .forEach(items) { tag in
                    .a(
//                        .class("post-category post-category-\(tag.string.lowercased())"),
//                        .href(site.path(for: tag)),
//                        .text(tag.string)
                    )
                })
    }
}
