---
date: 2021-10-26 9:00
description: Development of my Portfolio Website
tags: html, css, swift, projects, 
---
# Portfolio Website

```
static func AllTags<T: Website>(for items: [Item<T>], on site: T) -> Node {
    var everyTag = [Tag]()
    
    items.forEach { item in
        item.tags.forEach { subItem in
            everyTag.append(subItem)
        }
    }
    
    var uniqueTags = Array(Set(everyTag))
    uniqueTags = uniqueTags.sorted { $0.string < $1.string }
    return
        .div(
            .h1("All tags"),
                .tagList(for: uniqueTags, on: site)
        )
}
```
