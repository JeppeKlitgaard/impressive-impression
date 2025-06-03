#import "theme.typ": theme-helper
#import "themes/forty-seconds.typ": theme-fortyseconds

#let cv(
  theme: theme-fortyseconds,
  paper: "a4",
  main-contents: (),
  aside-contents: (),
) = {
  /// Helper function to get key from theme
  let th = theme-helper(theme)

  set page(
    paper: paper,
    margin: 0pt,
  )

  set text(..th("base-text"))

  // Insets
  let _aside-inset = (
    top: th("margin"),
    bottom: th("margin"),
  )
  if th("aside-side") == "right" {
    _aside-inset.right = th("margin")
    _aside-inset.left = th("gutter-margin")
  } else if th("aside-side") == "left" {
    _aside-inset.right = th("gutter-margin")
    _aside-inset.left = th("margin")
  }

  let _main-inset = (
    top: th("margin"),
    bottom: th("margin"),
  )
  if th("aside-side") == "right" {
    _main-inset.left = th("margin")
    _main-inset.right = th("gutter-margin")
  } else if th("aside-side") == "left" {
    _main-inset.left = th("gutter-margin")
    _main-inset.right = th("margin")
  } else if th("aside-side") == none {
    _main-inset.left = th("margin")
    _main-inset.right = th("margin")
  }

  /// Asides
  let _aside-heading(it) = {
    if it.level == 1 {
      // Name
      set align(center)
      set text(
        ..th("aside-name-text"),
      )
      it
    } else if it.level == 2 {
      set text(
        ..th("aside-heading-text"),
      )

      if th("aside-heading-line-enable") {
        box(it) + box(context {

          let size = measure(it)

          let a = here().position()

          let start = a.x + size.width

          let left-over-space = th("aside-width") - th("margin") - size.width
          let gap = th("aside-heading-line-gap")

          let stroke-line = (
            paint: th("aside-heading-text").fill,
            thickness: th("aside-heading-line-thickness"),
            cap: "butt",
          )
          let stroke-line-end = (
            paint: th("aside-heading-text").fill,
            thickness: th("aside-heading-line-thickness"),
            cap: "round",
          )
          let _line = line(start: (gap, 0%), length: left-over-space - gap, stroke: stroke-line)
          let _boxed-line = box(_line, height: size.height)
          let _line2 = line(start: (gap, 0%), length: 0pt, stroke: stroke-line-end)
          let _boxed-line2 = box(_line2, height: size.height)

          // let _line = align(box(line(length: left-over-space), height: size.height), horizon)
          align(_boxed-line + _boxed-line2, horizon)
          // [#_line]
        }, width: 0pt)
      } else {
        it
      }

    } else {
      it
    }
  }

  let wrap-aside(aside) = {
    let _aside = [
      #set text(..th("aside-text"))
      #show heading: _aside-heading
      #aside
    ]

    block(
      inset: _aside-inset,
      width: th("aside-width"),
      height: 100%,
      fill: th("aside-background-color"),
      _aside,
    )
  }

  // Main
  let _main-heading(it) = {
    if it.level == 2 {
      set text(..th("main-heading-text"))
      it
    } else if it.level == 3 {
      set text(..th("main-subheading-text"))
      it
    }
  }

  let wrap-main(main) = {
    let _main = [
      #set text(..th("main-text"))
      #show heading: set block(above: 1em)
      #show heading: _main-heading
      #main
    ]

    block(
      inset: _main-inset,
      width: 100%,
      height: 100%,
      fill: none,
      _main,
    )
  }
  // Wrap
  let wrapped-mains = ()
  let wrapped-aside = ()

  for main in main-contents {
    wrapped-mains.push(wrap-main(main))
  }

  for aside in aside-contents {
    wrapped-aside.push(wrap-aside(aside))
  }

  if th("aside-side") == none {
    wrapped-aside = (none,) * wrapped-mains.len()
  }

  let contents = ()
  if th("aside-side") == "left" {
      contents = wrapped-aside.zip(wrapped-mains)
  } else if th("aside-side") == "right" {
      contents = wrapped-mains.zip(wrapped-aside)
  } else {
      contents = wrapped-aside.zip(wrapped-mains)
  }

  let final-contents = ()
  for (index, (left, right)) in contents.enumerate() {
    let grid-contents = ()
    let split = false
    if left != none and right != none {
      split = true
    }

    if split {
      grid-contents.push(left)
      grid-contents.push(grid.vline(stroke: th("gutter-stroke")))
      grid-contents.push(right)
    } else if left != none {
      grid-contents.push(
        grid.cell(left, rowspan: 2)
      )
    } else if right != none {
      grid-contents.push(
        grid.cell(right, rowspan: 2)
      )
    }

    if index != 0 {
      final-contents.push(pagebreak())
    }

    final-contents.push(grid(
      columns: 2,
      ..grid-contents,
    ))
  }

  [
    #set text(..th("base-text"))
    #final-contents.join()
  ]
}
