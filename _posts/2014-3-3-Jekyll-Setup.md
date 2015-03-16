---
layout: post
title: Jekyll Github.io Page Setup
author: Elliot Boney
---

I got my [github.io] page finally cranking out pages with [Jekyll]. Here is a brief rundown of what it does, why it's baller, and how you can get your own going quickly. You should definitely get one started today, it's free.

### WTF is [Jekyll]?
Essentially [Jekyll] translates your plain text into static websites and blogs. You can use [Markdown] or [Textile] to write your posts and pages, and out comes a static site. There is no database to mess with, although you can use [collections] to store your data. It has a really awesome template language called [Liquid] that let's you do stuff like this (an example from my own menu):
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



### Get Your Repo
Follow the instructions over at [github.io] to get your repo started, cloned locally and goin.
If you are ADD and want the short version just do this:
1. Go [create a repo] named ```username.github.io``` where username is, well, your username.
2. ```git clone https://github.com/username/username.github.io```
3. Finally, to get it going,
{% highlight bash %}
cd username.github.io
echo "Hello World" > index.html
git add --all
git commit -m "Initial commit"
git push -u origin master
{% endhighlight %}


### Setup Jekyll ###
Go into your ```username.github.io``` directory and do the following:

Create a file named ```Gemfile``` with the following contents:
{% highlight ruby %}
source 'https://rubygems.org'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)

gem 'github-pages', versions['github-pages']
{% endhighlight %}

Then to install it all and get it serving locally
{% highlight bash %}
bundle install
gem install jekyll
jekyll serve
{% endhighlight %}

### Create a Post ###
If you don't have one already, go into ```/_posts/``` and create a markdown file. For more instructions head over to the [Jekyll Now repository](https://github.com/barryclark/jekyll-now) on GitHub.


### Do More ###
To get a really good idea of how to get templating and such going, and if you are like me and learn by seeing a working example and then copying the parts you like, go to [my .io repo].
{% highlight bash %}
├── _data
├── _includes     # holds the different includes for templates
├── _layouts      # holds your layouts
├── _posts        # posts go in here, i prefer .md
├── _sass         # default sass include directory (for style.scss imports)
├── _site         # where Jekyll compiles the site to
├── assets        # where I keep my images, js, vendor files
├── 404.html      # with this file, 404 errors will go here
├── Gemfile       # bundler file we created earlier
├── _config.yml   # yaml format configuration
├── index.html    # main index file
└── style.scss    # main style file
{% endhighlight %}

<!-- Links follow here -->
[Jekyll]: http://jekyllrb.com/
[Markdown]: http://daringfireball.net/projects/markdown/
[github.io]: https://pages.github.com/
[Github]: http://github.com
[Textile]: http://redcloth.org/textile
[collections]: http://jekyllrb.com/docs/collections/
[Liquid]: http://liquidmarkup.org/
[create a repo]: https://github.com/new
[my .io repo]: https://github.com/elliotboney/elliotboney.github.io
