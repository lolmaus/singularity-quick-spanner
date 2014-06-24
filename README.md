Singularity Quick Spanner
=========================

A collection of handy mixins making [Singularity](https://github.com/Team-Sass/Singularity) quicker to use.



Manipulating grid definitions
-----------------------------

### Overriding the grid definition

Singularity designed to be used with a single, consistent, site-wide grid definition. It is a rather common situation that in a certain portion of your page you would like to set up a grid different from what you have defined.

Previously, you had to do this:

```sass
+sgs-reset(grids)
+sgs-reset(gutters)
+add-grid(1 3 1)
+add-gutter(0.1)
```

Quite a number of lines. Singularity Quick Spanner provides a shortcut:

```sass
+reset-grid(1 3 1, 0.1)
```

Simply apply it and span your elements in the new grid.



### Applying grid definitions in place

Once you do that, you've lost the previously defined grid. This means that you'll have to reapply the grid definition every time you're going to span anything.

If you're not following a single consistent site-wide grid definition and instead use separate grid defintions for every portion of your pages, the described approach can in fact be very convenient. You no longer need to set up responsive grids in advance and can apply them in place:

```sass
.genres
  +clearfix

  .genre
    +reset-grid(2, 0.1)
    
    &._bossanova
      +grid-span(1, 1)
    
    &._downtempo
      +grid-span(1, 2)
    
    &._lounge
      +grid-span(1, 1, $options: both)
    
    &._elecrtoswing
      +grid-span(1,2)
      
    +breakpoint('700px')
      +reset-grid(4, 0.2)
      
      &._bossanova
        +grid-span(1, 1)
      
      &._downtempo
        +grid-span(1, 2)
      
      &._lounge
        +grid-span(1, 3)
      
      &._elecrtoswing
        +grid-span(1, 4)
``` 



### Saving and restoring current grid definition

But what if you do maintain a site-wide grid definition? Reapplying it after reset would be a PITA.

Singularity Quick spanner provides a couple of handy mixins that let you save and restore a grid definition:

```sass
+save-grid
+reset-grid(12, 0.1)

.column
  +float-span(1)
  
  &:nth-child(12n+12)
    +float-span(1, last)
    
+restore-grid
```

You can think of these mixins as of clipboard for your grid definition.

**Please note** that using the [`layout` mixin](https://github.com/Team-Sass/Singularity/wiki/Spanning-The-Grid#group-context-overrides) is a much better (and recommended) method of ad-hoc grid overriding. Use `save-grid`/`restore-grid` only in situations where using `layout` is incovenient.



Spanning a thumbnail grid
-------------------------

A thumbnail grid is a symmetric grid of equal-sized elements. The number of elements may vary, but is enough to fill at least several rows of the grid.

Singularity Quick Spanner lets you effortlessly set up a thumbnail grid of given parameters:

```sass
.thumbnail
  +thumb-grid(5, 0.1)
```

Should be applied to a class corresponding to each thumbnail (grid cell).
Spans thumbnails in a grid by applying float spans to the nth-child/nth-of-type pseudoclasses.

This makes most sense with symmetric grids, but it will still do the job
if an asymmetric grid is provided.

Arguments:

- `$cols`: The number of columns to use.
  
  Allowed values: a positive unitless integer. Default is the current grid definition.

- `$guts`: Gutter size, relative to a single column size.
  
  Allowed values: a non-negative float. Default is the current gutter definition.

- `$gutstyle`: Gutter style. Default is the current gutter definition.
  
  Allowed values: i don't know. :) This value is simply passed to Singularity. See the [corresponding docs page](https://github.com/Team-Sass/Singularity/wiki/Creating-Grids#gutter-styles).

- `$pseudoclass`: The pseudoclass used to apply spans to is constructed with ":nth-" and this value.
  
  Allowed values: `child` (default) or `of-type`.

- `$center-last-row`: The last row of thumbnails may contain less elements than any other row. To make it look better, it can be centered.
  
  Allowed values: `true` or `false` (default).

- `$bottom-margins`: Applies bottom margins to thumbnails proportional to grid gutters. This results in even vertical and horizontal gutters.
  
  Allowed values: `true` (default) or `false`.

- `$cancel-last-row-margins`: Negate bottom margins for thumbnails in the last row, so that the parent doesn't have what appears to be bottom padding.
  
  Allowed values: `true` or `false` (default).

The `$center-last-row` and `$cancel-last-row-margins` apply styles to the first item of the last row using a combination of `nth-child` and `nth-last-child` pseudoselectors. This would normally work only if you know the exact number of items in the grid. For these features to work with an arbitrary number of items, an excessive amount of CSS has to be generated. Use the `$overhead-min` and `$overhead-max` arguments to set the range of quantities of items to be styled. The larger the range, the more CSS will be generaged. Hold tight and pray for gzip compression.

- `$overhead-min`: The starting number of grid items for which an excessive number of CSS should be generated.
  
  Allowed values: a positive unitless integer. Default: 1.

- `$overhead-max`: The last number of grid items for which an excessive number of CSS should be generated.
  
  Allowed values: a positive unitless integer. Default: 20.

If you know the exact number of items in the grid, set both arguments to the same value and no excessive CSS will be created.

Default values are stored in the following global variables:

* `$sqs-thumb-span-pseudoclass`
* `$sqs-thumb-span-center-last-row`
* `$sqs-thumb-span-bottom-margins`
* `$sqs-thumb-span-cancel-last-row-margins`
* `$sqs-thumb-span-overhead-min`
* `$sqs-thumb-span-overhead-max`

Feel free to override them.




Spanning a responsive thumbnail grid
------------------------------------

Setting up a responsive thumbnail grid requires a substantial amount of work.

With Singularity Breakpoint Slicer you can do it with a snap of fingers:

```sass
.thumbnail
  +rwd-thumb-grid
```

This mixin leverages Breakpoint Slicer to create a responsive thumbnail grid. Within every slice (media query), it will apply a thumb-span, increasing the number of columns for every subsequent slice.

Arguments:

- `$start-cols`: Number of columns to start in the first slice.

  Allowed values: A positive unitless integer. Default: 1.
  
- `$start-slice`: Slice number to start with.

  Allowed values: A positive unitless integer. Default: 1.
  
It can accepts all arguments available for `thumb-grid` (except `$cols`, which is calculated dynmamically). Don't forget to define `$guts`!
                    



Demo
----

A demo is worth a thousand words!

Please have a look: http://lolmaus.github.io/singularity-quick-spanner



Installation and dependencies
-----------------------------

Singularity Quick Spanner can be installed either from Bower or as a Compass extension from RubyGems. Package name is `singularity-quick-spanner`.

Singularity Quick Spanner depends on [Singularity](https://github.com/Team-Sass/Singularity) and [Breakpoint](http://breakpoint-sass.com/). The RWD spanning mixin also depends on [Breakpoint Slicer](https://github.com/lolmaus/breakpoint-slicer) which is not yet available through Bower.

The Compass extension will automatically require Singularity, which in turn automatically requires Breakpoint. So you only need to do `require 'singularity-quick-spanner'` in your `config.rb`. Breakpoint Slicer is an optional dependency, you'll have to require it manually.

Singularity Quick Spanner will not automatically import dependencies for you, so please import them manually.

Singularity Quick Spanner needs Sass v3.3.x or greater. If you're using Compass, it should be v1.x or greater.