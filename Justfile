root := justfile_directory()

export TYPST_ROOT := root

[private]
default:
  @just --list --unsorted

# fail if typst version is the one we use in this project
# this helps reproducibility of generated outputs and tests
assert-typst-version:
  ./scripts/assert-typst-version

thumbnail:
  typst compile --pages=1 --ppi=300 --format=png template/cv.typ thumbnail.png
  oxipng thumbnail.png

demo:
  typst compile --format=pdf template/cv.typ demo.pdf

# run test suite
test *args: assert-typst-version
  tt --font-path "fonts/FontAwesome6" --font-path "fonts/OpenSans" run {{ args }}

# update test cases
update *args:
  tt --font-path "fonts/FontAwesome6" --font-path "fonts/OpenSans" update {{ args }}

# package the library into the specified destination folder
package target:
  ./scripts/package "{{target}}"

# install the library with the "@local" prefix
install: (package "@local")

# install the library with the "@preview" prefix (for pre-release testing)
install-preview: (package "@preview")

[private]
remove target:
  ./scripts/uninstall "{{target}}"

# uninstalls the library from the "@local" prefix
uninstall: (remove "@local")

# uninstalls the library from the "@preview" prefix (for pre-release testing)
uninstall-preview: (remove "@preview")

# run ci suite
ci: test

# bump version (major, minor, or patch)
bump part:
  ./scripts/version-bump "{{part}}"

# Run dev suite
dev: thumbnail demo test

[linux]
install-fonts:
  mkdir -p ~/.local/share/fonts
  cp fonts/FontAwesome6/*.otf ~/.local/share/fonts/
  cp fonts/OpenSans/*.ttf ~/.local/share/fonts/
  fc-cache -fv
