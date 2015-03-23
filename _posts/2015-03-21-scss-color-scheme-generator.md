---
title: SCSS Color Scheme Generator
tags: [js, design, sass]
featimg: /assets/img/png/schemescss.png
---
I hated all the overhead and interfaces out there for making a quick color scheme. Plus, they only gave me colors out, and I wanted some freaking SCSS.

Here we start with a single base color and then use the color spin method and lighten/darken methods to expand this into five colors that go together well. To generate the complementary colors, we “spin” the color wheel 180 degrees, the others are just slight variations on our starting color.
<br/><br/>


<div class="color-select text-center">
  <p>Pick a Base Color:
  <input type="text" id="color" value="#145C99" />
  </p>
</div>
<hr/>
<h3 class="text-center">Complementary Color Scheme</h3>
<div class="boxes">
  <div class="box color1"><div class="hex"></div></div>
  <div class="box color2"><div class="hex"></div></div>
  <div class="box color3"><div class="hex"></div></div>
  <div class="box color4"><div class="hex"></div></div>
  <div class="box color5"><div class="hex"></div></div>
</div>
<button type="button" class="btn btn-primary btn-lg center-block" data-toggle="modal" data-target="#myModal">
  See SCSS Output
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">SCSS Output</h4>
      </div>
      <div class="modal-body">
        <pre>
          <code id="code" class="scss"></code>
        </pre>
      </div>
    </div>
  </div>
</div>
<hr/>
<h3 class="text-center">Subtle (Monochromatic) Color Scheme</h3>
<div class="boxes-mono">
  <div class="boxmono five"><div class="hex"></div></div>
  <div class="boxmono four"><div class="hex"></div></div>
  <div class="boxmono one"><div class="hex"></div></div>
  <div class="boxmono two"><div class="hex"></div></div>
  <div class="boxmono three"><div class="hex"></div></div>
</div>
<button type="button" class="btn btn-primary btn-lg center-block" data-toggle="modal" data-target="#myModalmono">
  See SCSS Output
</button>

<!-- Modal -->
<div class="modal fade" id="myModalmono" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">SCSS Output</h4>
      </div>
      <div class="modal-body">
        <pre>
          <code id="codemono" class="scss"></code>
        </pre>
      </div>
    </div>
  </div>
</div>

<style>
  .color5 {
    border-top-right-radius: 3px;
    border-bottom-right-radius: 3px;
  }

  .color1 {
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
  }

  #color {
    width: 100px;
    padding: 2px !important;
    text-align: center;
  }

  .color-select {
    margin:10px auto;
  }

  input[type="text"]{
    /*font-family: 'Source Code Pro';*/
    display:inline-block !important;
    margin:5px;
    width:80px;
    padding:10px;
    border-radius:3px;
    background:#eee;
    border:none;
  }

  .boxes, .boxes-mono {
    overflow:auto;
    margin:10px 0;
  }
  .box, .boxmono {
    width:20%;
    height:300px;
    float:left;
  }

  .hex {
    width:50%;
    margin: 0 auto;
    background: rgba(255,255,255, 0.5);
    padding:5px;
    color:black;
    margin-top:30px;
    font-family: 'Source Code Pro';
    border-radius: 3px;
  }

  code {
    font-family: 'Source Code Pro';
    clear:both;
    text-align:left !important;
    background:#eeeeee;
    border-radius:3px;
    display:block;
    padding:35px !important;
    line-height:1.4;
    /*margin:25px auto;*/
    /*width:50%;*/
  }

  .sp-replacer {
    border-radius: 3px;
    height: 40px;
    margin-top: -6px;
    padding: 0;
    border: none;
  }

  .sp-preview {
    border-radius: 3px;
    border: none;
    height: 40px;
    width: 40px;
    margin: 0;
    padding: 0;
  }

  .sp-dd {
    display: none;
  }
</style>

<script src="//cdnjs.cloudflare.com/ajax/libs/spectrum/1.6.1/spectrum.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/highlight.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/languages/scss.min.js"></script>
<script>
  $('head').append('<link href="https://cdnjs.cloudflare.com/ajax/libs/spectrum/1.6.1/spectrum.min.css" type="text/css" rel="stylesheet"/>');
  $('head').append('<link href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/styles/zenburn.min.css" type="text/css" rel="stylesheet"/>');

  $('#color').on('change', function() {
    colorSelect();
    colorSelectMono();
  });

  $(function() {
    hljs.initHighlightingOnLoad();
    colorSelect();
    colorSelectMono();
  });

  var $color = $('#color');
  $('#color').spectrum({
    color: $color.val(),
    preferredFormat: "hex"
  });

  function colorSelect() {
    var color = $color.val();
    $('head').append('<style type="text/less">@base:'+color+'; @complement1: lighten(spin(@base, 180),15%); @complement2: lighten(spin(@base, 180),10%); @lighten1: lighten(@base, 15%); @lighten2: lighten(@base, 25%); .color3{background:@base;} .color2{background:@complement2;} .color1{background:@complement1;} .color4{background:@lighten1;} .color5{background:@lighten2;}</style>');
    $.getScript('//cdnjs.cloudflare.com/ajax/libs/less.js/1.7.3/less.min.js', function() {
     $('.box').each(function(){
      var bg = $(this).css('background-color');
      var rgbString = bg;
      var parts = rgbString.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
      delete (parts[0]);
      for (var i = 1; i <= 3; ++i) {
        parts[i] = parseInt(parts[i]).toString(16);
        if (parts[i].length == 1) parts[i] = '0' + parts[i];
      }
      var hexString ='#'+parts.join('').toUpperCase();
      $(this).children('.hex').html(hexString);
    });
   });

    $('#code').html(
      '$base: '+color+';\n'+
      '$complement1: lighten(adjust-hue($base, 180),15%);\n' +
      '$complement2: lighten(adjust-hue($base, 180),10%);\n' +
      '$lighten1: lighten($base, 15%);\n' +
      '$lighten2: lighten($base, 25%);\n' +
      '.color1 { background: $complement1; }\n' +
      '.color2 { background: $complement2; }\n' +
      '.color3 { background: $base; }\n' +
      '.color4 { background: $lighten1; }\n' +
      '.color5 { background: $lighten2; }'
      );
  }

  function colorSelectMono() {
    var color = $color.val();

    $('head').append('<style type="text/less">@basemono:'+color+'; @lighter1: lighten(spin(@basemono, 5), 10%); @lighter2: lighten(spin(@basemono, 10), 20%); @darker1: darken(spin(@basemono, -5), 10%); @darker2: darken(spin(@basemono, -10), 20%); .one   {background: @basemono;} .two   {background: @lighter1;} .three {background: @lighter2;} .four  {background: @darker1;} .five  {background: @darker2;}</style>');
    $.getScript('//cdnjs.cloudflare.com/ajax/libs/less.js/1.7.3/less.min.js', function() {
     $('.boxmono').each(function(){
      var bg = $(this).css('background-color');
      var rgbString = bg;
      var parts = rgbString.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
      console.log($(this));
      delete (parts[0]);
      for (var i = 1; i <= 3; ++i) {
        parts[i] = parseInt(parts[i]).toString(16);
        if (parts[i].length == 1) parts[i] = '0' + parts[i];
      }
      var hexString ='#'+parts.join('').toUpperCase();
      $(this).children('.hex').html(hexString);
    });
   });

    $('#codemono').html(
      '$base: '+color+';\n'+
      '$lighter1: lighten(spin($base, 5), 10%);\n'+
      '$lighter2: lighten(spin($base, 10), 20%);\n'+
      '$darker1: darken(spin($base, -5), 10%);\n'+
      '$darker2: darken(spin($base, -10), 20%);\n'+
      '.one   { background: $base; }\n'+
      '.two   { background: $lighter1; }\n'+
      '.three { background: $lighter2; }\n'+
      '.four  { background: $darker1; }\n'+
      '.five  { background: $darker2; }'
      );
  }

  function rgb2hex(rgb){
   rgb = rgb.match(/^rgb((d+),s*(d+),s*(d+))$/);
   return "#" +
   ("0" + parseInt(rgb[1],10).toString(16)).slice(-2) +
   ("0" + parseInt(rgb[2],10).toString(16)).slice(-2) +
   ("0" + parseInt(rgb[3],10).toString(16)).slice(-2);
 }
</script>