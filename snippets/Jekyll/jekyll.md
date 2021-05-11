# Jekyll

<!-- MarkdownTOC -->

* [Installation](#installation)
* [Directory Structure](#directory-structure)
* [Build & Serve](#build--serve)
* [Liquid](#liquid)
* [Front Matter](#front-matter)
* [Layouts](#layouts)
* [Includes](#includes)
* [Data Files](#data-files)
* [Styles](#styles)
* [Posts](#posts)
* [Collections](#collections)
* [Permalinks](#permalinks)
* [Themes](#themes)
* [Importing](#importing)
* [Auto-Generated Anchor Links](#auto-generated-anchor-links)
	* [AnchorJS](#anchorjs)
	* [Manual](#manual)

<!-- /MarkdownTOC -->


<a id="installation"></a>
## Installation

```bash
gem install jekyll bundler
jekyll new myblog
cd myblog
bundle exec jekyll serve # build and make available on local server
# Now browse to http://localhost:4000
```

<a id="directory-structure"></a>
## Directory Structure

```bash
.
├── _config.yml
├── _data
|   └── members.yml
├── _drafts
|   ├── begin-with-the-crazy-ideas.md
|   └── on-simplicity-in-technology.md
├── _includes
|   ├── footer.html
|   └── header.html
├── _layouts
|   ├── default.html
|   └── post.html
├── _posts
|   ├── 2007-10-29-why-every-programmer-should-play-nethack.md
|   └── 2009-04-26-barcamp-boston-4-roundup.md
├── _sass
|   ├── _base.scss
|   └── _layout.scss
├── _site
├── .jekyll-metadata
└── index.html # can also be an 'index.md' with valid front matter
```

<a id="build--serve"></a>
## Build & Serve

```bash
jekyll build      # builds and outputs site to _site dir
jekyll serve     # builds and watches
bundle install # relies on a Gemfile. Similar to npm install. Local by default
bundle update
bundle exec jekyll serve # The full command when using a Gemfile
```

<a id="liquid"></a>
## Liquid

To get Jekyll to process liquid, add `# front matter` at the top of the page

**Objects**

Object tell Liquid where to output content. Denoted by curly braces:

```bash
{{ page.title }}
```

**Tags**

Tags create the logic and control flow for templates. Denoted by {% and %}

```html
{% if page.show_sidebar %}
<div class="sidebar">
  sidebar content
</div>
{% endif %}
```

See: [Jekyll - Liquid - Tags](https://jekyllrb.com/docs/liquid/tags/)

**Filters**

Change the output of a Liquid object:

```bash
{{ "hi" | capitalize }} # Outputs HI
```

See: [Liquid Filters](https://jekyllrb.com/docs/liquid/tags/)


<a id="front-matter"></a>
## Front Matter

A snippet of YAML or JSON between two triple dashed lines at the top of the file. Used to set variables on the page

```html
---
title: Home
---
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
  </head>
  <body>
    <h1>{{ "Hello World!" | downcase }}</h1>
  </body>
</html>
```


<a id="layouts"></a>
## Layouts

The `content` variable has the value of rendered content on the page it's called from.

1. Define a layout in `_layouts/layout_name.html`

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{{ page.title }}</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  {{ content }}
</body>
</html>
```

2. Use front matter to call that layout:

```bash
# index.html
---
layout: default
<a id="title-home"></a>
title: Home
---
```

Layouts can inherit other layouts.

<a id="includes"></a>
## Includes

Store includes in `_include/hame.html`

Include them via `  {% include name.html %}`

Current Page Highlighting via conditional example:

```html
<nav>
  <a href="/" {% if page.url == "/" %}style="color: red;"{% endif %}>Home</a>
  <a href="/about.html" {% if page.url == "/about.html" %}style="color: red;"{% endif %} class="">About</a>
</nav>
```

<a id="data-files"></a>
## Data Files

Jekyll supports loading from YAML, JSON, and CSV files in `_data`

Jekyll makes these available `site.data.filename`. Ex:

```
- name: Home
  link: /
- name: About
  link: /about.html
```

<a id="styles"></a>
## Styles

Jekyll will look for styles in `_sass` dir

<a id="posts"></a>
## Posts

Live in the `_posts` folder. Jekyll makes post data available via `site.post.property`

* `post.title` is pulled from the post's filename and can be overrided via front matter.
* `post.excerpt` is the first paragraph by default

<a id="collections"></a>
## Collections

Similar to posts, except the content doesn't need to be grouped by date.

* Jekyll needs to be informed of the collection via `_config.yml`
* Collections live in `_collection-name` folders.
* Jekyll makes the collections available via `site.collection-name`

By default, collections don't output a page for each document (item in the collection). To change this behavior:

```yaml
collections:
  authors:
    output: true
```


Jekyll Front Matter - written in either YAML or JSON.

<a id="permalinks"></a>
## Permalinks

* Defined via a front matter variable: `permalink: "/my-new-url"` will output: `site.com/my-new-url`
* You can also use variables
  * `/:categories` injects the categories defined in front matter into the URL. ex: `/:categories/:year/:month/:title`

```yaml
# _config.yml
defaults:
  -
    scope:
      path: "" - tells us what dir to apply this to. If blank, then it applies to everything
      type: "posts"
    values:
      layout: post
      title: "My title"
```

<a id="themes"></a>
## Themes
Jekyll ships w/ `Minima` theme. You can check what theme you're using in `_config.yml`

* [rubygems.org](rubygems.org) - search for [jekyll-theme](rubygems.org) - many themes use this in their name
  * The bottom of a theme's page usually has a Homepage link, which is generally a GitHub repo

Install:

```bash
# Grab theme name and add to gem file
bundle install
update config file
bundle exec jekyll serve

# You'll need to re-add or re-create your page layouts
```

<a id="importing"></a>
## Importing

From WordPress.com:

```bash
ruby -r rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::WordpressDotCom.run({
      "source" => "wordpress.xml",
      "no_fetch_images" => false,
      "assets_folder" => "assets"
    })'
```

From WP.org sites:
[has_many :codes Migrate from WordPress to Jekyll From WordPress.org sites: ](https://vitobotta.com/2011/03/28/migrate-from-wordpress-to-jekyll/)

Other Tools:
[GitHub - wpXml2Jekyll](https://github.com/theaob/wpXml2Jekyll)

<a id="auto-generated-anchor-links"></a>
## Auto-Generated Anchor Links

<a id="anchorjs"></a>
### AnchorJS

https://www.bryanbraun.com/anchorjs/#basic-usage

Relevant files:

* https://github.com/bryanbraun/anchorjs/blob/master/anchor.js
* https://github.com/bryanbraun/anchorjs/blob/master/anchor.min.js

<a id="manual"></a>
### Manual 

```html
<!-- Auto-generate anchor links -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
```

```js
$(function() {
  return $("h2, h3, h4, h5, h6").each(function(i, el) {
    var $el, icon, id;
    $el = $(el);
    id = $el.attr('id');
    icon = '<i class="fa fa-link"></i>';
    if (id) {
      return $el.prepend($("<a />").addClass("header-link").attr("href", "#" + id).html(icon));
    }
  });
});
```

```css
/* Heading Anchor links */
.header-link {
  position: absolute;
  left: -0.5em;
  opacity: 0;

  \-webkit-transition: opacity 0.2s ease-in-out 0.1s;
  \-moz-transition: opacity 0.2s ease-in-out 0.1s;
  \-ms-transition: opacity 0.2s ease-in-out 0.1s;
}

h2:hover .header-link,
h3:hover .header-link,
h4:hover .header-link,
h5:hover .header-link,
h6:hover .header-link {
  opacity: 1;
}
```

