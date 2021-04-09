# Jekyll Snippets

<!-- MarkdownTOC -->

* [Jekyll Plugins to Check Out](#jekyll-plugins-to-check-out)
* [Deploying to GitHub Pages](#deploying-to-github-pages)
  * [Relative URLs](#relative-urls)
* [Building Jekyll](#building-jekyll)
* [Import WordPress.com Posts](#import-wordpresscom-posts)
* [Nav Menu - Dealing With Relative and Absolute URLs](#nav-menu---dealing-with-relative-and-absolute-urls)
* [List Collection Items In Reverse](#list-collection-items-in-reverse)
* [List Recent Posts](#list-recent-posts)
* [Change Layout Based on Post Type](#change-layout-based-on-post-type)
* [Related Posts](#related-posts)
  * [Related Posts By Tag](#related-posts-by-tag)
  * [Related Posts By Categories](#related-posts-by-categories)
* [List Categories With Number of Posts](#list-categories-with-number-of-posts)
  * [Categories and Posts](#categories-and-posts)
* [Tag Cloud](#tag-cloud)
* [Custom Classes and Attributes on Markdown Elements](#custom-classes-and-attributes-on-markdown-elements)
* [Local vs GitHub Pages](#local-vs-github-pages)
* [Quickly Convert HTML to Markdown with Pandoc](#quickly-convert-html-to-markdown-with-pandoc)
  * [Plugins](#plugins)
* [Dealing With Data and Collections](#dealing-with-data-and-collections)
* [Remove Unwanted  Tags](#remove-unwanted-tags)
* [Post Excerpts](#post-excerpts)
* [Category Pages](#category-pages)
* [SCSS Baseurl Variable](#scss-baseurl-variable)

<!-- /MarkdownTOC -->

<a id="jekyll-plugins-to-check-out"></a>
## Jekyll Plugins to Check Out

* [Jekyll Now](https://github.com/barryclark/jekyll-now)
* [Jekyll Include Cache](https://github.com/benbalter/jekyll-include-cache)
*

<a id="deploying-to-github-pages"></a>
## Deploying to GitHub Pages

<a id="relative-urls"></a>
### Relative URLs

In `_config.yml`, set the `baseurl` option to `/project-name` – note the leading slash and the absence of a trailing slash.

When referencing JS or CSS files, do it like this: `{{ site.baseurl}}/path/to/css.css` – note the slash immediately following the variable (just before "path").

When doing permalinks or internal links, do it like this: `{{ site.baseurl }}{{ post.url }}` – note that there is no slash between the two variables.

Finally, if you’d like to preview your site before committing/deploying using jekyll serve, be sure to pass an empty string to the `--baseurl` option, so that you can view everything at `localhost:4000` normally (without `/project-name` at the beginning):  `jekyll serve --baseurl ''`

This way you can preview your site locally from the `site root` on `localhost`, but when GitHub generates your pages from the `gh-pages` branch all the URLs will start with `/project-name` and resolve properly.

<a id="building-jekyll"></a>
## Building Jekyll

If you don't need to regenerate all your posts:

`jekyll serve --watch --limit_posts 1`

<a id="import-wordpresscom-posts"></a>
## Import WordPress.com Posts

```ruby
ruby -r rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::WordpressDotCom.run({
      "source" => "wordpress.xml",
      "no_fetch_images" => false,
      "assets_folder" => "assets"
    })'
```

<a id="nav-menu---dealing-with-relative-and-absolute-urls"></a>
## Nav Menu - Dealing With Relative and Absolute URLs

```php
{%- if titles_size > 0 -%}
<nav class="site-nav top-nav">
  {% assign prefix = "/get" | append: include.year | default: "2016" %}
  {% if prefix contains "201" %}
    {% assign year = "2015" %}
  {% endif %}
  <ul class="trigger nav-links">
  {% for menu in site.data.navigation %}
    {% if menu[0] contains include.year %}
      {% for item in menu[1] %}
        {% unless item.url contains "http"%}
          <li><a href="{{ site.baseurl }}{{ year_str }}{{ item.url }}">{{ item.title }}</a></li>
        {% endunless %}
        {% if item.url contains "http" %}
        <li><a href="{{ item.url }}">{{ item.title }}</a></li>
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endfor %}
  </ul>
</nav>
{%- endif -%}
```


<a id="list-collection-items-in-reverse"></a>
## List Collection Items In Reverse

```ruby
{% comment %}
*
*  This loop loops through a collection called `collection_name`
*  and sorts it by the front matter variable `date` and than filters
*  the collection with `reverse` in reverse order
*
*  To make it work you first have to assign the data to a new string
*  called `sorted`.
*
<ul>
    {% assign sorted = site.collection_name | sort: 'date' | reverse %}
    {% for item in sorted %}
    <li>{{ item.title }}</li>
    {% endfor %}
</ul>

{% %}
```


<a id="list-recent-posts"></a>
## List Recent Posts

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>

{% assign maxPost = 5 %}
{% assign counter = 0 %}
{% for post in site.posts | sort:"date" | reverse %}
    {% if post.thumb %}
        <img src= ... />
        {% assign counter = counter | plus: 1 %}
        {% if counter == maxPost %}
            {% break %} {% comment %}exit the for loop{% endcomment %}
        {% endif %}
    {% endif %}
{% endfor %}

<a id="change-layout-based-on-post-type"></a>
## Change Layout Based on Post Type

Specify default settings in `_config.yml`

```yaml
defaults:
  -
    scope:
      path: ""      # empty string for all files
      type: posts   # limit to posts
    values:
      is_post: true # automatically set is_post=true for all posts
```

then you can use {{ page.is_post }} to check whether the page is post.

You can also use `{{ page.id }}` to check if the page is a post
  * The ID seems to be the permalink? And only posts will have them

<a id="related-posts"></a>
## Related Posts

<a id="related-posts-by-tag"></a>
### Related Posts By Tag

From: https://blog.webjeda.com/jekyll-related-posts/

```html
<div class="relatedPosts">

<h4>You May Also Enjoy</h4>

{% assign maxRelated = 4 %}
{% assign minCommonTags =  2 %}
{% assign maxRelatedCounter = 0 %}

  {% for post in site.posts %}

    {% assign sameTagCount = 0 %}
    {% assign commonTags = '' %}

    {% for tag in post.tags %}
      {% if post.url != page.url %}
        {% if page.tags contains tag %}
          {% assign sameTagCount = sameTagCount | plus: 1 %}
          {% capture tagmarkup %} <span class="label label-default">{{ tag }}</span> {% endcapture %}
          {% assign commonTags = commonTags | append: tagmarkup %}
        {% endif %}
      {% endif %}
    {% endfor %}

    {% if sameTagCount >= minCommonTags %}
      <div>
      <h5><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}{{ commonTags }}</a></h5>
      </div>
      {% assign maxRelatedCounter = maxRelatedCounter | plus: 1 %}
      {% if maxRelatedCounter >= maxRelated %}
        {% break %}
      {% endif %}
    {% endif %}

  {% endfor %}

</div>
```

<a id="related-posts-by-categories"></a>
### Related Posts By Categories

From: https://blog.webjeda.com/jekyll-related-posts/

```html
<div class="relatedPosts">

<h4>You May Also Enjoy</h4>

{% assign maxRelated = 4 %}
{% assign minCommonTags =  2 %}
{% assign maxRelatedCounter = 0 %}

{% for post in site.posts %}

    {% assign sameTagCount = 0 %}
    {% assign commonTags = '' %}

    {% for category in post.categories %}
      {% if post.url != page.url %}
        {% if page.categories contains category %}
          {% assign sameTagCount = sameTagCount | plus: 1 %}
          {% capture tagmarkup %} <span class="label label-default">{{ category }}</span> {% endcapture %}
          {% assign commonTags = commonTags | append: tagmarkup %}
        {% endif %}
      {% endif %}
    {% endfor %}

    {% if sameTagCount >= minCommonTags %}
      <div>
      <h5><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}{{ commonTags }}</a></h5>
      </div>
      {% assign maxRelatedCounter = maxRelatedCounter | plus: 1 %}
      {% if maxRelatedCounter >= maxRelated %}
        {% break %}
      {% endif %}
    {% endif %}

  {% endfor %}
</div>

```
<a id="list-categories-with-number-of-posts"></a>
## List Categories With Number of Posts

```html
<h2>Categories</h2>
<ul>
{% assign categories_list = site.categories %}
  {% if categories_list.first[0] == null %}
    {% for category in categories_list %}
      <li><a href="#{{ category | downcase | downcase | url_escape | strip | replace: ' ', '-' }}">{{ category | camelcase }} ({{ site.tags[category].size }})</a></li>
    {% endfor %}
  {% else %}
    {% for category in categories_list %}
      <li><a href="#{{ category[0] | downcase | url_escape | strip | replace: ' ', '-' }}">{{ category[0] | camelcase }} ({{ category[1].size }})</a></li>
    {% endfor %}
  {% endif %}
{% assign categories_list = nil %}
</ul>
```

<a id="categories-and-posts"></a>
### Categories and Posts

```html
<h2>Categories</h2>
<ul>
{% assign categories_list = site.categories %}
  {% if categories_list.first[0] == null %}
    {% for category in categories_list %}
      <li><a href="#{{ category | downcase | downcase | url_escape | strip | replace: ' ', '-' }}">{{ category | camelcase }} ({{ site.tags[category].size }})</a></li>
    {% endfor %}
  {% else %}
    {% for category in categories_list %}
      <li><a href="#{{ category[0] | downcase | url_escape | strip | replace: ' ', '-' }}">{{ category[0] | camelcase }} ({{ category[1].size }})</a></li>
    {% endfor %}
  {% endif %}
{% assign categories_list = nil %}
</ul>

{% for category in site.categories %}
  <h3 id="{{ category[0] | downcase | url_escape | strip | replace: ' ', '-' }}">{{ category[0] | camelcase }}</h3>
  <ul>
    {% assign pages_list = category[1] %}
    {% for post in pages_list %}
      {% if post.title != null %}
      {% if group == null or group == post.group %}
      <li><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <time datetime="{{ post.date | date_to_xmlschema }}" itemprop="datePublished">{{ post.date | date: "%B %d, %Y" }}</time></a></li>
      {% endif %}
      {% endif %}
    {% endfor %}
    {% assign pages_list = nil %}
    {% assign group = nil %}
  </ul>
{% endfor %}
```


<a id="tag-cloud"></a>
## Tag Cloud

See the following:
* https://superdevresources.com/tag-cloud-jekyll/
*

```html
<!-- From: https://superdevresources.com/tag-cloud-jekyll/ -->

<h1>Tag Cloud</h1>
{% assign tags = site.tags | sort %}
{% for tag in tags %}
 <span class="site-tag">
    <a href="/tag/{{ tag | first | slugify }}/"
        style="font-size: {{ tag | last | size  |  times: 4 | plus: 80  }}%">
            {{ tag[0] | replace:'-', ' ' }} ({{ tag | last | size }})
    </a>
</span>
{% endfor %}

.site-tag a {
    display: inline-block;
    margin-right: 12px;
}
```

<a id="custom-classes-and-attributes-on-markdown-elements"></a>
## Custom Classes and Attributes on Markdown Elements

Add the following after your markdown element:

`{: .list-margin-bottom #custom_id attribute='value' }`

<a id="local-vs-github-pages"></a>
## Local vs GitHub Pages

In `_config.yml`, set the baseurl option to `/project-name` – note the leading slash and the absence of a trailing slash.

When referencing JS or CSS files, do it like this: {{ site.baseurl}}/path/to/css.css – note the slash immediately following the variable (just before “path”).

When doing permalinks or internal links, do it like this: `{{ site.baseurl }}{{ post.url }}` – note that there is no slash between the two variables.

Finally, if you’d like to preview your site before committing/deploying using jekyll serve, be sure to pass an empty string to the `--baseurl` option, so that you can view everything at localhost:4000 normally (without /project-name at the beginning):  `jekyll serve --baseurl ''`

This way you can preview your site locally from the site root on localhost, but when GitHub generates your pages from the `gh-pages` branch all the URLs will start with /project-name and resolve properly.

<a id="quickly-convert-html-to-markdown-with-pandoc"></a>
## Quickly Convert HTML to Markdown with Pandoc

```bash
find . -name "*.ht*" | while read i; do pandoc -f html -t markdown "$i" -o "${i%.*}.md"; done
```

<a id="plugins"></a>
### Plugins

GitHub Pages Default Plugins:

* jekyll-coffeescript
* jekyll-gist
* jekyll-github-metadata
* jekyll-paginate
* jekyll-relative-links
* jekyll-optional-front-matter
* jekyll-readme-index
* jekyll-default-layout
* jekyll-titles-from-headings

GitHub Pages Optional Plugins:

* jekyll-feed
* jekyll-redirect-from
* jekyll-seo-tag
* jekyll-sitemap
* jekyll-avatar
* jemoji
* jekyll-mentions
* jekyll-include-cache

<a id="dealing-with-data-and-collections"></a>
## Dealing With Data and Collections

```html
{%- for agenda_hash in site.data.agendas -%}
  {%- assign year = agenda_hash[0] -%}
  {%- if year contains include.year -%}
      {%- assign ay = "a" | append: include.year -%}
      {%- assign agenda = agenda_hash[1][ay] -%}
      {%- assign day1 = agenda.day1 -%}
      {%- assign day2 = agenda.day2 -%}
      {%- assign day3 = agenda.day3 -%}
      {%- endif -%}
{%- endfor -%}

{%- if include.date1 -%}
  <h3 class="agenda-heading">{{ include.date1 }}</h3>
  <ul class="session-list">
    {%- for session in day1 -%}
      <li class="sessions {{ session.class }}">
        <time class="session-time">{{ session.time }}</time>
        <div class="session-details">
          <span class="session-title"><strong>{{ session.title }}</strong></span>
          {{ session.details | markdownify }}
        </div>
      </li>
    {%- endfor -%}
  </ul>
{%- endif -%}

{%- if include.date2 -%}
  <h3 class="agenda-heading">{{ include.date2 }}</h3>
  <ul class="session-list">
    {%- for session in day2 -%}
    <li class="sessions {{ session.class }}">
      <time class="session-time">{{ session.time }}</time>
      <div class="session-details">
        <span class="session-title"><strong>{{ session.title }}</strong></span>
        {{ session.details | markdownify }}
      </div>
    </li>
    {%- endfor -%}
  </ul>
{%- endif-%}

{%- if include.date3 -%}
  <h3 class="agenda-heading">{{ include.date3 }}</h3>
  <ul class="session-list">
    {%- for session in day3 -%}
    <li class="sessions {{ session.class }}">
      <time class="session-time">{{ session.time }}</time>
      <div class="session-details">
        <span class="session-title"><strong>{{ session.title }}</strong></span>
        {{ session.details | markdownify }}
      </div>
    </li>
    {%- endfor -%}
  </ul>
{%- endif-%}
```

```ruby
<b><p>The Mothership:</b></p>
<p>{{ site.data.events }}</p>

<p><b>site.data.events["past-events"]:</b> {{ site.data.events["past-events"] }}<br></p>
<p><b>site.data.events["current-events"]:</b> {{ site.data.events["current-events"] }}<br></p>
<p><b>site.data.events["upcoming-events"]:</b> {{ site.data.events["upcoming-events"] }}<br></p>
<p><b>site.data.events["past-events"][1]:</b> {{ site.data.events["past-events"][1] }}<br></p>
<p><b>site.data.events["current-events"][2]:</b> {{ site.data.events["current-events"][1] }}<br></p>
<p><b>site.data.events["upcoming-events"][3]:</b> {{ site.data.events["upcoming-events"][1] }}<br></p>
```

```html
{% for collection in site.collections %}
  {% if include.col_name contains collection.label %}
  <ul class="speakers-list">
    {% assign sorted = (collection.docs | sort: 'last') %}
    {% for speaker in sorted %}
  <li class="speaker">
    <img class="speaker-img" src="{{ speaker.image | relative_url | escape }}" alt="{{ speaker.name }}">
    <div class="speaker-bio">{{ speaker.content }}</div>
  </li>
  {% endfor %}
</ul>
  {% endif%}
{% endfor %}
```

<a id="remove-unwanted-tags"></a>
## Remove Unwanted <p> Tags

```ruby
{{ "[![Franklin Institute](images/TFI.jpg)](http://www.fi.edu/)" | markdownify | remove: '<p>' | remove: '</p>' }}
```

<a id="post-excerpts"></a>
## Post Excerpts

```ruby
Something like {{ post.content | strip_html | truncatewords: 50 }

Remember to use <!--more--> in the actual post to tell Jekyll where it should 'cut' the post for the excerpt content or set excerpt_separator globally in your _config.yml

http://jekyllrb.com/docs/posts/#post-excerpts
```

<a id="category-pages"></a>
## Category Pages

https://blog.webjeda.com/jekyll-categories/#display-categories-on-jekyll-posts

<a id="scss-baseurl-variable"></a>
## SCSS Baseurl Variable

```scss
// minima.scss
$baseurl: "{{ site.baseurl }}";
```
