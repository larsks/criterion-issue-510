#!/bin/sh

git clone --depth=1 https://github.com/Snaipe/Criterion.git
cd Criterion
meson build
meson install -C build
ldconfig

