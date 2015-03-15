---
layout: post
title: Jekyll Github.io Page Setup
---

I got my [github.io] page finally cranking out pages with [Jekyll]. Here is a brief rundown of what it does, why it's
baller, and how you can get your own going quickly. You should definitely get one started today, it's free.

### WTF is [Jekyll]?
Essentially [Jekyll] translates your plain text into static websites and blogs. You can use [Markdown] or [Textile] to
write your posts and pages, and out comes a static site. There is no database to mess with, although you can use
[collections] to store your data. It has a really awesome template language called [Liquid] that let's you do stuff like
this (an example from my own menu):
{% highlight html %}
{% raw %}
<li class="dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Posts <span class="caret"></span></a>
  <ul class="dropdown-menu" role="menu">
    {% for p in site.posts %}
      {% include menu_item.html %}
    {% endfor %}
  </ul>
</li>
{% endraw %}
{% endhighlight %}



### Get your repo
Follow the instructions over at [github.io] to get your repo started, cloned locally and goin.



The easiest way to make your first post is to edit this one. Go into /_posts/ and update the Hello World markdown file.
For more instructions head over to the [Jekyll Now repository](https://github.com/barryclark/jekyll-now) on GitHub.



<!-- Links follow here -->
[Jekyll]: http://jekyllrb.com/
[Markdown]: http://daringfireball.net/projects/markdown/
[github.io]: https://pages.github.com/
[Github]: http://github.com
[Textile]: http://redcloth.org/textile
[collections]: http://jekyllrb.com/docs/collections/
[Liquid]: http://liquidmarkup.org/
