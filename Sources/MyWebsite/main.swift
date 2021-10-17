import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
struct MyWebsite: Website {
    enum SectionID: String, WebsiteSectionID, CaseIterable {
        // Add the sections that you want your website to contain here:
        case home
        case projects
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "www.KalinduDahanayake/KalinduDahanayake.github.io")!
    var name = "KalinduDahanayake"
    var description = "KalinduDahanayake Portfolio Page"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

extension Theme where Site == MyWebsite {
    static var myTheme: Theme {
        Theme(htmlFactory: MyHTMLFactory(), resourcePaths: ["Resources/MyTheme/styles.css"])
    }
}

// This will generate your website using the built-in Foundation theme:
//try MyWebsite().publish(withTheme: .myTheme, plugins: [.splash(withClassPrefix: "")])
//try MyWebsite().publish(withTheme: .myTheme)

try MyWebsite().publish(
    withTheme: .myTheme,
    deployedUsing: .gitHub("KalinduDahanayake/KalinduDahanayake.github.io", useSSH: false),
    plugins: [.splash(withClassPrefix: "")]
)


//try MyWebsite().publish(using: [
//    .deploy(using: .gitHub("KalDah1/KalDah1.github.io"))
//])
