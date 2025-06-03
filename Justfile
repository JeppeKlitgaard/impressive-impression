root := justfile_directory()

export TYPST_ROOT := root

[private]
default:
  @just --list --unsorted

# generate manual
doc:
  typst compile docs/manual.typ docs/manual.pdf
  typst compile docs/thumbnail.typ thumbnail-light.svg

thumbnail:
  typst compile --pages=1 --ppi=300 --format=png template/cv.typ docs/thumbnail.png

# run test suite
test *args:
  tt --root . --font-path "fonts/FontAwesome6/*.otf" --font-path "fonts/OpenSans/*.ttf" run {{ args }}

# update test cases
update *args:
  tt update {{ args }}

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
ci: test doc

[linux]
install-fonts:
  mkdir -p ~/.local/share/fonts
  cp fonts/FontAwesome6/*.otf ~/.local/share/fonts/
  cp fonts/OpenSans/*.ttf ~/.local/share/fonts/
  fc-cache -fv
