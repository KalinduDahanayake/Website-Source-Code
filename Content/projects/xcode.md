---
date: 2021-10-09 14:50
description: My experience in iOS Development.
tags: swift, ios, projects
---
# Xcode and iOS

My first post's text.

```
static func AllTags<T: Website>(for items: [Item<T>], on site: T) -> Node {
    var unique = [Tag]()
    items.forEach { item in
        item.tags.forEach { subItem in
            unique.append(subItem)
        }
    }
    
    unique = Array(Set(unique))
    return
        .div(
            .h1("All tags"),
                .tagList(for: unique, on: site)
            
        )
}
```

