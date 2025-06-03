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

- 🏃‍➡️ GitHub Runner for rendering CV and uploading as an artifact
- 📄 1, 2, or more pages
- 📝 Two-column (left or right), or single column
- 🎨 Themable
- 📊 Stats and skills section

## Template adaptation checklist

- [ ] Fill out `README.md`
  - Change the `my-package` package name, including code snippets
  - Check section contents and/or delete sections that don't apply
- [ ] Fill out `typst.toml`
  - See also the [typst/packages README](https://github.com/typst/packages/?tab=readme-ov-file#package-format)
- [ ] Adapt Repository URLs in `CHANGELOG.md`
  - Consider only committing that file with your first release, or removing the "Initial Release" part in the beginning
- [ ] Adapt or deactivate the release workflow in `.github/workflows/release.yml`
  - to deactivate it, delete that file or remove/comment out lines 2-4 (`on:` and following)
  - to use the workflow
    - [ ] check the values under `env:`, particularly `REGISTRY_REPO`
    - [ ] if you don't have one, [create a fine-grained personal access token](https://github.com/settings/tokens?type=beta) with [only Contents permission](https://stackoverflow.com/a/75116350/371191) for the `REGISTRY_REPO`
    - [ ] on this repo, create a secret `REGISTRY_TOKEN` (at `https://github.com/[user]/[repo]/settings/secrets/actions`) that contains the so created token

    if configured correctly, whenever you create a tag `v...`, your package will be pushed onto a branch on the `REGISTRY_REPO`, from which you can then create a pull request against [typst/packages](https://github.com/typst/packages/)
- [ ] remove/replace the example test case
- [ ] (add your actual code, docs and tests)
- [ ] remove this section from the README

## Getting Started

These instructions will get you a copy of the project up and running on the typst web app. Perhaps a short code example on importing the package and a very simple teaser usage.

```typ
#import "@preview/impressive-impression:0.1.0": *

#show: my-show-rule.with()
#my-func()
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./thumbnail-dark.svg">
  <img src="./thumbnail-light.svg">
</picture>

### Installation

A step by step guide that will tell you how to get the development environment up and running. This should explain how to clone the repo and where to (maybe a link to the typst documentation on it), along with any pre-requisite software and installation steps.

```
$ First step
$ Another step
$ Final step
```

## Usage

A more in-depth description of usage. Any template arguments? A complicated example that showcases most if not all of the functions the package provides? This is also an excellent place to signpost the manual.

```typ
#import "@preview/my-package:0.1.0": *

#let my-complicated-example = ...
```

## Additional Documentation and Acknowledgments

* Project folder on server:
* Confluence link:
* Asana board:
* etc...
  
## Attribution

Images in `assets/flags` are from [Lipis](https://github.com/lipis)'s
[flag-icons](https://github.com/lipis/flag-icons) project,
which is MIT licensed.

Inspiration comes from the LaTeX-based [FortySecondsCV] and [Twenty Seconds Curriculum Vitae] projects.

[Typst]: https://typst.app/
[FortySecondsCV]: https://github.com/PandaScience/FortySecondsCV
[Twenty Seconds Curriculum Vitae]: https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex
