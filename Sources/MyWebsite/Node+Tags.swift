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
    
    static func tagList<T: Website>(for tags: [Tag], on site: T) -> Node {
        return
            .div(
                .forEach(tags) { tag in
                    .a(
                        .class("post-category post-category-\(tag.string.lowercased())"),
                        .href(site.path(for: tag)),
                        .text(tag.string)
                    )
                })
    }
}
