//
//  File.swift
//  
//
//  Created by Kalindu Dahanyake on 10/10/21.
//
import Foundation
import Publish
import Plot

extension MyHTMLFactory {
    func makeHomeHTML<T: Website>(for index: Index, section: Section<T>, context: PublishingContext<T>) throws -> HTML {
        
        return
            HTML(
                .head(for: index, on: context.site),
                .body(
                    .myHeader(for: context),
                    .myFooter(for: context.site)
                )
        )
    }
}
