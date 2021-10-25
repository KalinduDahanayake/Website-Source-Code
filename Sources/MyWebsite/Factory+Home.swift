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
        var homeImage: Path { "Images/S7iaWZsg.jpg" }
        
        return
            HTML(
                .head(for: index, on: context.site),
                .body(
                    .myHeader(for: context),
                    .img (
                        .class("logo-image"),
                        .src(homeImage)
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
                    ),
                    .div(
//                        .class("div-padding"),
                        .class("dynamic-typing"),
                        .h1(
//                            .class("dynamic-typing"),
                            .text("// My name is Kalindu Dahanayake.")
                        ),
                        .h1(
//                            .class("dynamic-typing"),
                            .text("// Welcome to my Portfolio Page.")
                        )
                    ),
                    .myFooter(for: context.site)
                )
                
        )
    }
}
