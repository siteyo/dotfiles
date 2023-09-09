#!/bin/bash

print_default() {
	echo -e "$*"
}

print_info() {
	echo -e "\e[1;36m$*\e[m" # cyan
}

print_notice() {
	echo -e "\e[1;35m$*\e[m" # magenta
}

print_success() {
	echo -e "\e[1;32m$*\e[m" # green
}

print_warning() {
	echo -e "\e[1;33m$*\e[m" # yellow
}

print_error() {
	echo -e "\e[1;31m$*\e[m" # red
}

print_done() {
  print_success "Done!"
}
