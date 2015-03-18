---
title: How to get from color A to color B, Programmatically
tags: [sass, js]
---
Have you ever wanted to know how to get from color A to color B, programmatically? I have found myself on several occasions using a button, or some other styled html element and wanting to change the colors. The problem is I can't tell how the original author got from, say, the main button color to the shadow of the button color. I'm going to give you how I got there first with SCSS, then converted that JS as a tool for anyone to use.

First, the SCSS:

{% highlight scss %}
/**
 * Solves "how to programmatically go from #BADA55 to #B0BCA7"?
 * Give a start color, and a target color, this will output the SCSS function
 * necessary to get to that color in terms of lighten/darken, hue, saturation/desat
 * ---
 * @author Elliot Boney <elliotboney@gmail.com>
 */

// Pick your colors
$start: #983709;
$target: #46A6DE;

/**
 * Solves how to programmatically go from #BADA55 to #B0BCA7"?
 * --------------------------------------------------------------------------------
 * @param (color) start: start color
 * @param (color) target: target color
 * --------------------------------------------------------------------------------
 * @return (map) returns the color operations to do in order to find $target from $start
 *   where keys are the color functions to apply
 *   and values are the values to pass to these functions
 */

@function color-diff($start, $target) {
  $sat: saturation($start) - saturation($target);
  $lig:  lightness($start) -  lightness($target);
  $fn-sat: if($sat > 0%, 'desaturate', 'saturate');
  $fn-lig: if($lig > 0, 'darken', 'lighten');


  // Output the colors
  $newtarget: #{$start};

  // Do we need a hue adjustment?
  @if -(hue($start) - hue($target)) != 0deg {
    $newtarget: 'adjust-hue(#{$start}, #{-(hue($start) - hue($target))})';
  }

  // Do we need to saturate/desaturate?
  @if abs($sat) != 0% {
    @if #{abs($sat)} != '100%' {
      $newtarget: #{$fn-sat}(#{$newtarget}, #{abs($sat)})
    }
  }

  // Do we need to lighten/darken?
  @if abs($lig) != 0% {
    $newtarget: #{$fn-lig}(#{$newtarget}, #{abs($lig)});
  }

  @debug    '

  #{$newtarget}; //

  ';

  @if #{abs($sat)} == '100%' {
    @return (
      adjust-hue: -(hue($start) - hue($target)),
      #{$fn-lig}: abs($lig)
      );
  }

  @return (
    adjust-hue: -(hue($start) - hue($target)),
    #{$fn-sat}: abs($sat),
    #{$fn-lig}: abs($lig)
    );

}

/**
 * Apply differences returned from `color-diff` function to a color
 * In order to retrieve the second color
 *
 * @param  {color} $color color to transform
 * @param  {map}   $diff  diff map
 *
 * @return {color}        [description]
 */
@function apply-diff($color, $diff) {
  // We call the $key (function),
  // passing the $color and the $value as parameters
  // e.g. `call(adjust-hue, #BADA55, 42)`
  @each $key, $value in $diff {
    $color: call($key, $color, $value);
  }
  @return $color;
}

// Calculate the diff map between those 2
$diff: color-diff($start, $target);
// This is a map looking like this:
// $diff: (
//   adjust-hue: 42,
//   saturation: 13.37%,
//   lightness: 1.5%
// );

// Apply the diff to one of the two colors to find the second one
$c: apply-diff($start, $diff);

// Is everything okay?
sass {
  a: $start;
  b: $target;
  c: $c; // $target == $c, awesome!
}

$allcaps: to-upper-case(#{$c+''});

@debug '#{$start} --> #{$target} = #{$allcaps}';
// Visual representation if you prefer
// left part is $start
// middle part is $target
// third part is $c, generated from $start
html {
  background: -webkit-linear-gradient(left, $start 33%, $target 33%, $target 66%, $c 66%);
  height: 100%;
}
{% endhighlight %}


<!-- links and shit -->
[MapBox]: http://www.mapbox.com/
[Leaflet]: http://leafletjs.com/