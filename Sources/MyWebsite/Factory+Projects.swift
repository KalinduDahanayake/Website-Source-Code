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
    func makeProjectsHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
         HTML(
            .head(for: context.index, on: context.site),
            .body(
                .myHeader(for: context),
                .AllTags(for: section.items, on: context.site),
                .postContent(for: section.items, on: context.site),
                .myFooter(for: context.site)
            )
        )
    }
}
