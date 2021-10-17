//
//  File.swift
//  
//
//  Created by Kalindu Dahanyake on 10/10/21.
//

import Foundation
import Publish
import Plot

struct MyHTMLFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        let sections = context.sections
        let section = sections.first(where: { $0.id.rawValue == "home" })!
        
        return try makeHomeHTML(for: index, section: section, context: context)
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        switch section.id.rawValue {
            case "projects":
                return try makeProjectsHTML(for: section, context: context)
            case "home":
                return try makeHomeHTML(for: context.index, section: section, context: context)
            case "about":
                return try makeAboutHTML(for: context.index, section: section, context: context)
            default:
                return try makeProjectsHTML(for: section, context: context)
        }
    }
    
    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
                .head(for: item, on: context.site),
                .body(
                    .myHeader(for: context),
                    .wrapper(
                        .article(
                            .contentBody(item.body)
                        )
                    ),
                    .myFooter(for: context.site)
                )
            )
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML(.text("Hello, page"))
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(.text("Hello, tag list"))
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(
                .head(for: context.index, on: context.site),
                .body(
                    .myHeader(for: context),
                    .h1(
                        .text("All posts with the tag \(page.tag.string)")
                    ),
                    .postContent(for: context.items(taggedWith: page.tag), on: context.site),
                    .myFooter(for: context.site)
                )
            )
    }
    
    
    

}
