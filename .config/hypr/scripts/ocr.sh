#!/usr/bin/env bash

grim -g "$(slurp)" /tmp/text-extract.png &&
  tesseract /tmp/text-extract.png /tmp/text-extract &&
  cat /tmp/text-extract.txt | wl-copy
