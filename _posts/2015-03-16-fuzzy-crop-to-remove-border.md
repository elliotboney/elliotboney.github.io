---
title: Remove a Border Using "Fuzzy Crop"
---
Here is the [ImageMagick] command I ended up using to get this to work. Essentially I had to adjust the contrast using [sigmoidal contrast], to a point that would darken skies enough so when I did a 'fuzzy crop', the sky would not get cropped as well.

Well the output of this would look horrible, all I wanted to keep was the size of the output, as well as the offset of the crop to the original. Note below, I use this information formatted using ```-format '%wx%h%O' info:``` as a mask to crop my original image.

This way I get to keep my untouched colors and levels, but use the crop from my adjusted one. The blur gave me about an extra 5 pixel white border around the image, which I quickly fixed with a ```-shave 3x3```.

{% highlight bash %}
convert -crop `input.jpg +sigmoidal-contrast 5,15 -blur 10 -bordercolor White -border 1 -fuzz 30% -trim -format '%wx%h%O' info:` +repage -shave 3x3 -filter Catrom -size 640x480 -resize 640x480 input.jpg output.jpg
{% endhighlight %}

<style>
  .cropping .col-xs-6 {
    padding-top: 20px;
    padding-bottom: 20px;
    border-top: 1px solid #efefef;
  }
  .noborder {
    border: none !important;
  }

  .retsthumb {
    border: 16px #C50DBD solid;
    max-height: 350px;
    margin-top: 38%;
    display: block;
    position: relative;
    top: 50%;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    transform: translateY(-50%);
  }

  .thumbcol {
    height: 380px;
  }
</style>



<div class="row cropping">
  <div class="col-xs-6 noborder">
    <h4 class="text-center">Before</h4>
  </div>
  <div class="col-xs-6 noborder">
    <h4 class="text-center">After</h4>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/15/3318115-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/15/3318115-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/15/3318115-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/15/3318115-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/03/3101703-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/03/3101703-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/03/3101703-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/03/3101703-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/57/3318557-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/57/3318557-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/57/3318557-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/57/3318557-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/26/3318926-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/26/3318926-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/26/3318926-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/26/3318926-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/95/2236895-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/95/2236895-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/95/2236895-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/95/2236895-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/68/3317968-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/68/3317968-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/68/3317968-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/68/3317968-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/68/2134868-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/68/2134868-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/68/2134868-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/68/2134868-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/40/3095240-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/40/3095240-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/40/3095240-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/40/3095240-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/48/3277548-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/48/3277548-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/48/3277548-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/48/3277548-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/50/3318350-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/50/3318350-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/50/3318350-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/50/3318350-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/00/3122100-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/00/3122100-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/00/3122100-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/00/3122100-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
  <div class="col-xs-6 thumbcol">
    <a href="http://media.nuhabitat.com/media/photo/2/640x640/16/3096116-0.jpg" target="_blank"><img src="http://media.nuhabitat.com/media/photo/2/640x640/16/3096116-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="col-xs-6 thumbcol">
    <a href="http://elliot.nuhabitat.com/media/photo/2/640x640/16/3096116-0.jpg" target="_blank"><img src="http://elliot.nuhabitat.com/media/photo/2/640x640/16/3096116-0.jpg" class="img-responsive retsthumb"/></a>
  </div>
  <div class="clearfix"></div>
  <!-- End Set -->
</div>

## Todo ##
- [ ] Get the black border images too!

[ImageMagick]: http://www.imagemagick.org/
[sigmoidal contrast]: http://www.imagemagick.org/script/command-line-options.php?#sigmoidal-contrast
