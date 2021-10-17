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
    static func myFooter<T: Website>(for site: T) -> Node {
        // Creates a variable to get the current year of today
        let currentYear = Calendar.current.component(.year, from: Date())
        let currentMonth = Calendar.current.component(.month, from: Date())
        let currentDate = Calendar.current.component(.day, from: Date())
        
        let string = "\(currentDate)/\(currentMonth)/\(currentYear)"
        
        return
            // Creates a container
            .div(
                // Provides a CSS class to this container
                .class("footer"),
                // Creates another container for copyright information
                .div(
                    .text(string)
                ),
                // Creates another container for link to John Sundell's publish repo
                .div(
                    .text("Generated using "),
                    .a(
                        .text("Publish"),
                        .href("https://github.com/johnsundell/publish")
                    ),
                    .text(". Written in Swift")
                )
        )
    }
}
