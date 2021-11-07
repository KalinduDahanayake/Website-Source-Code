---
date: 2021-10-26 9:00
description: Development of my Portfolio Website
tags: html, css, swift, projects, ongoing
---
# Portfolio Website
-> <a href="#First Deployment"> First Deployment</a><br/>
-> <a href="#Adding Images and Icons"> Adding Images and Icons</a><br/>
-> <a href="#CSS Fun">  CSS Fun</a><br/>
-> <a href="#All Tags">  All Tags</a><br/>

<br/>

Intially I had this portfolio website made using an [HTML5 UP](https://html5up.net/) template, specifically the _Landed_ template, which let me host a premade website without having to deal with complex HTML and CSS.  

<div class="padding"/>

<img src="/Images/oldWebsite.png"  width="100%"/>

<div class="padding"/>

However, I felt like I should be making my website from the ground up, rather than building upon a full-fleshed out CSS template. 

<div class="padding"/>

This is when I came across John Sundell's [Publish](https://https://github.com/JohnSundell/Publish.net/) framework, which uses Swift to compile HTML code and linking CSS. This also meant I had to write my own custom css templating as well as html code written using Swift syntax. 

<a id="First Deployment"/>

__First Deployment__
<img src="/Images/firstIteration.png"  width="100%"/>

Quite boring right? Let's change that.

<br/>

<a id="Adding Images and Icons"/>

__Adding Images and Icons__

<br/>

Adding images is fairly simple, the syntax takes after the HTML method, attributing an _img_ class and href the local file. 

```
var homeImage: Path { "Images/S7iaWZsg.jpg" }

...

    .img (
        .class("logo-image"),
        .src(homeImage)
    ),
```

That's it. A local image path, a css class and the src link for the img class. 


The footer icons were admitted done using png images instead of an icon pack like _fontawesome_. But I couldn't get the icon pack to work. 

````
var githubImage: Path { "Images/icons8-github-48.png" }
var linkedinImage: Path { "Images/174857.png" }
var emailImage: Path { "Images/icons8-gmail-48.png" }

...

.div(
    .class("icon"),
    .a(
        .href("https://www.linkedin.com/in/Kalindu-Dahanayake/"),
        .img (
            .src(linkedinImage)
        )
    ),
    .a(
        .href("https://github.com/KalinduDahanayake"),
        .img (
            .src(githubImage)
        )
    ),
    .a(
        .href("mailto:kalindu22@gmail.com"),
        .img (
            .src(emailImage)
        )
    )
)
````
That brings us to this version
<img src="/Images/secondIteration.png"  width="100%"/>
<a id="CSS Fun"/>
__CSS Fun__

I'm very proud of these CSS elements, mostly because it looks cool :)
The CSS code for the shooting star animation feature is quite long but here it is

```
...
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
...


// CSS


.p{
  left:0px;
  top:50px;
  width:2px;
  height:2px;
  background-color:white;
  position:absolute;
  animation-name:particleAnimation;
  animation-timing-function:ease-in;
  animation-iteration-count: infinite;
  z-index: -1;
}

.p::before{
  position:absolute;
  display:block;
  content:"";
  width:100px;
  right:1px;
  top:0px;
  height:1px;
  background: linear-gradient(to right, rgba(0,0,0,0) 0%,rgba(228, 72, 72, 1) 100%);
  animation-delay: 1000ms;
}

.p-1{
  animation-duration: 2.5s;
  animation-delay: 650ms;
}

... each shooting star has staggered delays so they appear to have randomised times 

.p-6{
  animation-duration: 3s;
  animation-delay: 450ms;
  top:90%;
}

```
The typing feature was similar in style. The div that contains all the text takes the CSS class  for the typing animation, and each h1 element is an nth-child of the class with the h1 element class.

```
...
.div(
    .class("dynamic-typing"),
    .h1(
        .text("// My name is Kalindu Dahanayake.")
    ),
    .h1(
        .text("// Welcome to my Portfolio Page.")
    )
)
...

// CSS

.dynamic-typing {
    text-align: auto;
    display: inline-block;
}
.dynamic-typing h1 {
    border-right: .15em solid #E44C65;
    font-family: "Courier";
    font-weight: bold;
    opacity: 0;
    font-size: 25px;
    margin: 0 right; /* Gives that scrolling effect as the typing happens */
    white-space: nowrap;
    overflow: hidden;
    color: white;
}

.dynamic-typing h1:nth-child(1) {
    width: 100%;
    animation: type 1s steps(40, end);
    animation-fill-mode: forwards;
    animation-delay: 1s;
    align-self: left;
}

.dynamic-typing h1:nth-child(2) {
    width: 100%;
    opacity: 0;
    animation: type2 1s steps(40, end), blink .5s step-end infinite alternate;;
    animation-delay: 3s;
    animation-fill-mode: forwards;
}
```

<div class="dynamic-typing">
<h1>// This gives this typing animation.</h1>
</div>


<a id="All Tags"/>
<br></br>

__All Tags__

This was a feature I worked on for a while, mostly figuring out the data structure that Publish uses. 

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


```
static func AllTags<T: Website>(for items: [Item<T>], on site: T) -> Node {
    var everyTag = [Tag]()
    
    items.forEach { item in
        item.tags.forEach { subItem in
            everyTag.append(subItem)
        }
    }
```
Essentially, each project post is considered an "Item", a struct contain all the information within the post. The function is given an array of all the projects. Then, within each item is an array of tag, which I append to an array of tags. 

```
var uniqueTags = Array(Set(everyTag))
uniqueTags = uniqueTags.sorted { $0.string < $1.string }
```
The array is put into a set, then back into an array. A set, in Swift, can't ever have duplicate elements, as such by converting an array into a set then into an array, only unique tags are left.

These tags are then sorted alphabetically.


```
return
    .div(
        .h1("All tags"),
            .tagList(for: uniqueTags, on: site)
    )

```
Finally,  all the tags are injected into the .tagList, which displays the input tags in a line.

<img src="/Images/allTags.png"  width="100%"/>


I also wrote a bash script to make the deployment easier, Publish already includes a deployment path but for unknown reasons, it does not work

<img src="/Images/pushScriptforWebsite.png"  width="100%"/>
