# Impressive Impression CV Template

_Impressive Impression_ is a CV (Curriculum Vitae) template for users wishing to
typeset their CV using [Typst].

It was developed to fit my personal CV, which I ported from LaTeX to Typst,
and as such is heavily inspired by the layout of the [FortySecondsCV] template for LaTeX,
which in turn is inspired by Carmine Spagnuolo's [Twenty Seconds Curriculum Vitae].

The template is highly flexible and supports themes.
It works as a split CV with a narrow column on the side (left or right) for shorter information,
or alternatively can be used in a single-column layout.

Usage of the template assumes some knowledge of [Typst], especially if
extensive customisation is undertaken.

## Features

- 🏃‍➡️ GitHub Runner for rendering CV and uploading as an artifact (see `.github/workflows/build.yml`)
- 📄 1, 2, or more pages
- 📝 Two-column (left or right), or single column
- 🎨 Themable
- 📊 Stats and skills section

## Installation

- _Impressive Impression_ relies on [Typst] to produce PDFs.
  - Existing knowledge of [Typst] is expected, including how to set it up and compile documents. 
- The default font is `Open Sans`, which must be installed to get the intended output
  - Simply install all the fonts in `fonts/OpenSans` folder
- By default, FontAwesome 6 Fonts are used
  - The fonts can be installed using the files in the `fonts/FontAwesome6` folder
  - Note that using FontAwesome icons is not a requirement and is not actually implemented in the `impressive-impression` package, but added directly in the default template.
- If you plan on cloning the _Impressive Impression_ repository, you should have [git-lfs] installed
  - This is installed by default in the Windows git installer

## Contributing

I am looking to actively maintain this template and would love to receive feedback
and enhancements.

If there is some styling that is not easily done via the theming dictionary,
please feel free to open an issue or Pull Request such that it can be improved for future versions.

## Getting Started

### Web-App

Find `impressive-impression` in the list of templates, give it an an appropriate title such as `My CV` and press create.

These instructions will get you a copy of the project up and running on the typst web app. Perhaps a short code example on importing the package and a very simple teaser usage.

In order for the fonts to be installed in the web app, upload the `fonts` directory found in this project to the Web App project.

You can then adapt the CV according to your preferences.

### Using Compiler Directly

You can check out the template using:
```sh
typst init "@preview/impressive-impression
```

Which will set up a folder with the necessary files.

This can then be adapted to suit your needs.

## Usage

In essence

A more in-depth description of usage. Any template arguments? A complicated example that showcases most if not all of the functions the package provides? This is also an excellent place to signpost the manual.

```typ
#import "@preview/my-package:0.1.0": *

#let my-complicated-example = ...
```
  
## Attribution and Acknowledgements

Images in `assets/flags` are from [Lipis](https://github.com/lipis)'s
[flag-icons](https://github.com/lipis/flag-icons) project,
which is MIT licensed.

Inspiration comes from the LaTeX-based [FortySecondsCV] and [Twenty Seconds Curriculum Vitae] projects.

Fonts in `fonts/FontAwesome6` are from the [FontAwesome] company and licensed under the SIL OFL 1.1 License.

Fonts in `fonts/OpenSans` are from Google's [OpenSans] project and licensed under the SIL OFL 1.1 License.

[Typst]: https://typst.app/
[FortySecondsCV]: https://github.com/PandaScience/FortySecondsCV
[Twenty Seconds Curriculum Vitae]: https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex
[FontAwesome Download]: https://fontawesome.com/download
[Google Fonts]: https://fonts.google.com
[git lfs]: https://git-lfs.com/
[FontAwesome]: https://fontawesome.com/
