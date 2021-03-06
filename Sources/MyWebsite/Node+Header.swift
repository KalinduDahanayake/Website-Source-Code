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
    
    static func myHeader<T: Website>(for context: PublishingContext<T>) -> Node {
        // Create a list of navigation items
        
        return .header(
            // Begin the wrapper class
            .wrapper(
                // Create your main title
                .h1("Kalindu Dahanayake"),
                // Create the nav node
                .nav(
                    // Create and undordered list and loop through your navItems yuou created above
                    .ul(
                        .forEach(
                            MyWebsite.SectionID.allCases
                        ) { item in
                            .li(
                                // Create an anchor tag to make linkes
                                .a(
                                    // Redirect the user to a new webpage on your site when they click each item
                                    .href("/\(item.rawValue.lowercased())"),
                                    .text(item.rawValue.capitalized)
                                )
                            )
                        }
                    )
                )
            )
        )
    }
}

