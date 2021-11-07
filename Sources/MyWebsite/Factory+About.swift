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
    func makeAboutHTML<T: Website>(for index: Index, section: Section<T>, context: PublishingContext<T>) throws -> HTML {
        var homeImage: Path { "Images/S7iaWZsg.jpg" }
        
        return
            HTML(
                .head(for: index, on: context.site),
                .body(
                    .div(
                        .class("page-container"),
                        .div(
                            .class("content-wrap"),
                            .myHeader(for: context),
                            .h2(
                                .text("ABOUT ME")
                            ),
                            .h3(
                                .text("A university student at UNSW just trying new things and keeping it together.")
                            ),
                            .h4(
                                .class("padding"),
                                .text("Degree: Bachelor of Mechatronics + Bachelor of Computer Science")
                            ),
                            .h4(
                                .class("padding"),
                                .text("Passions: Programming, photography and making things go.")
                            ),
                            .div(
                                .div(
                                    .class("p p-1")
                                ),
                                .div(
                                    .class("p p-2")
                                ),
                                .div(
                                    .class("p p-3")
                                ),
                                .div(
                                    .class("p p-4")
                                ),
                                .div(
                                    .class("p p-5")
                                ),
                                .div(
                                    .class("p p-6")
                                )
                            )
                        ),
                        .div(
                            .class("footer"),
                            .myFooter(for: context.site)
                        )
                    )
                )
                
                
        )
    }
}
