#!/bin/bash

print_default() {
  printf '%s\n' "$*"
}

print_info() {
  printf '\e[1;36m%s\e[m\n' "$*" # cyan
}

print_notice() {
  printf '\e[1;35m%s\e[m\n' "$*" # magenta
}

print_success() {
  printf '\e[1;32m%s\e[m' "$*" # green
}

print_warning() {
  printf '\e[1;33m%s\e[m' "$*" # yellow
}

print_error() {
  printf '\e[1;31m%s\e[m' "$*" # red
}

print_done() {
  print_success "Done!\n"
}
