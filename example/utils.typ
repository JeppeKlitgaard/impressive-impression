#import "@preview/fontawesome:0.5.0": fa-icon, fa-stack

#import "../src/theme.typ": theme-helper

#let flag(id, ..image-args) = {
  return image(
    "assets/flags/" + lower(id) + ".svg",
    ..image-args
  )
}

#let fa-icon-factory-stack(
  theme,
) = {
  let th = theme-helper(theme)

  let icon1-args = (
    "circle",
    (
      solid: true,
      fill: th("primary-accent-color"),
      size: 18pt,
    )
  )

  let icon2-args = (
    solid: true,
    fill: th("aside-background-color"),
    size: 12pt,
  )

  return (icon) => {
    let icon1 = icon1-args
    let icon2 = (icon, icon2-args)

    fa-stack(icon1, icon2)
  }
}

#let fa-icon-factory(
  theme,
) = {
  let th = theme-helper(theme)

  return (icon, solid: false, size: 18pt) => {
    let icon-args = (icon, (
      solid: solid,
      fill: th("primary-accent-color"),
      size: size,
    ))

    fa-stack(icon-args)
  }
}

/// Initial code taken from https://github.com/typst/typst/issues/1939#issuecomment-1680154871
#let colorize(svg, color) = {
  let select = regex("fill=\"([^\"]*)\"")
  if svg.contains(select) {
    // Just replace
    svg = svg.replace(select, "fill=\""+color.to-hex()+"\"")
    // svg = "asd"
  } else {
    // Explicitly state color
    svg = svg.replace("<svg ", "<svg fill=\""+color.to-hex()+"\" ")
  }

  return svg
}

#let read-and-colorize-svg(path, color, ..image-args) = {
  let svg-str = read(path)
  let svg-str-colorized = colorize(svg-str, color)
  let img = image(bytes(svg-str-colorized), format: "svg", ..image-args)
  return img
}