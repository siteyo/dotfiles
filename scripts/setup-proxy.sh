#!/bin/bash

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"

  local url port user password yn

  print_info '==> Setup proxy ...'
  print_default "http://<URL>:<Port>"
  read -rp "URL: " url
  read -rp "Port: " port
  print_default ''

  print_info "==> User Authentication? (Press enter to skip)"
  read -rp "User: " user
  [ -n "${user}" ] &&
    read -rsp "Password: " password
  print_default "\n"

  read -rp "Collect? (Y/n)" yn
  case "$yn" in
  [nN]*)
    print_notice 'abort.'
    exit 0
    ;;
  *) ;;
  esac
  print_default ''

  # wget
  print_info "==> ~/.wgetrc"
  local wgetrc="${HOME}/.wgetrc"
  touch "${wgetrc}"
  if grep -qiE '^\s*#\s*http_proxy=' "${wgetrc}"; then
    print_notice 'Environment variable was commented out.'
    print_notice 'Uncomment them.'
    sed -i -e '/^\s*#\s*http_proxy/s/#\s*//' "${wgetrc}"
    sed -i -e '/^\s*#\s*proxy_/s/#\s*//' "${wgetrc}"
  elif grep -qiE '^\s*http_proxy=' "${wgetrc}"; then
    print_notice "Already set up."
  else
    printf 'http_proxy=http://%s:%s\n' "${url}" "${port}" >>"${HOME}/.wgetrc"
    [ -n "${user}" ] && (
      printf 'proxy_user=%s\n' "${user}"
      printf 'proxy_password=%s\n' "${password}"
    ) >>"${wgetrc}"
  fi

  # curl
  print_info "==> ~/.curlrc"
  local curlrc="${HOME}/.curlrc"
  touch "${curlrc}"
  if grep -qiE '^s*#\s*proxy=' "${curlrc}"; then
    print_notice 'Environment variable was commented out.'
    print_notice 'Uncomment them.'
    sed -i -e '/^\s*#\s*proxy=/s/#\s*//' "${curlrc}"
  elif grep -q 'proxy=' "${curlrc}"; then
    print_notice "Already set up."
  else
    printf 'proxy=http://%s:%s\n' "${url}" "${port}" >>"${curlrc}"
    [ -n "${user}" ] &&
      printf 'proxy-user=%s:%s\n' "${user}" "${password}" >>"${curlrc}"

  fi

  # bash
  local bashrc
  if [ -f "${HOME}/.bashrc.local" ]; then
    print_info "==> ~/.bashrc.local"
    bashrc="${HOME}/.bashrc.local"
  else
    print_info "==> ~/.bashrc"
    bashrc="${HOME}/.bashrc"
  fi

  if grep -qiE '^\s*#\s*export\shttp_proxy' "${bashrc}"; then
    print_notice 'Environment variable was commented out.'
    print_notice 'Uncomment them.'
    sed -i -e '/^\s*#\s*export\shttp[s]*_proxy/s/#\s*//' "${bashrc}"
  elif grep -qiE '^\s*export\shttp_proxy=' "${bashrc}"; then
    print_notice 'Already set up.'
  else
    if [ -n "${user}" ]; then
      (
        printf 'export http_proxy=http://%s:%s@%s:%s\n' "${user}" "${password}" "${url}" "${port}"
        printf 'export https_proxy=http://%s:%s@%s:%s\n' "${user}" "${password}" "${url}" "${port}"
      ) >>"${bashrc}"
    else
      (
        printf 'export http_proxy=http://%s:%s\n' "${url}" "${port}"
        printf 'export https_proxy=http://%s:%s\n' "${url}" "${port}"
      ) >>"${bashrc}"
    fi
  fi

  # zsh
  local zshrc
  if [ -f "${HOME}/.zshrc.local" ]; then
    print_info "==> ~/.zshrc.local"
    zshrc="${HOME}/.zshrc.local"
  else
    print_info "==> ~/.zshrc"
    zshrc="${HOME}/.zshrc"
  fi

  if grep -qiE '^\s*#\s*export\shttp_proxy' "${zshrc}"; then
    print_notice 'Environment variable was commented out.'
    print_notice 'Uncomment them.'
    sed -i -e '/^\s*#\s*export\shttp[s]*_proxy/s/#\s*//' "${zshrc}"
  elif grep -qiE '^\s*export\shttp_proxy=' "${zshrc}"; then
    print_notice 'Already set up.'
  else
    if [ -n "${user}" ]; then
      (
        printf 'export http_proxy=http://%s:%s@%s:%s\n' "${user}" "${password}" "${url}" "${port}"
        printf 'export https_proxy=http://%s:%s@%s:%s\n' "${user}" "${password}" "${url}" "${port}"
      ) >>"${zshrc}"
    else
      (
        printf 'export http_proxy=http://%s:%s\n' "${url}" "${port}"
        printf 'export https_proxy=http://%s:%s\n' "${url}" "${port}"
      ) >>"${zshrc}"
    fi
  fi

  # apt
  print_info "==> /etc/apt/apt.conf.d/proxy.conf"
  local source_apt_proxy dest_apt_proxy
  source_apt_proxy="${HOME}/proxy.conf"
  dest_apt_proxy="/etc/apt/apt.conf.d/proxy.conf"
  if [ -f "${dest_apt_proxy}" ]; then
    print_notice 'Already set up.'
  else
    touch "${source_apt_proxy}"
    if [ -n "${user}" ]; then
      (
        printf 'Acquire::http::Proxy http://%s:%s@%s:%s\n' "${user}" "${password}" "${url}" "${port}"
        printf 'Acquire::https::Proxy http://%s:%s@%s:%s\n' "${user}" "${password}" "${url}" "${port}"
      ) >>"${source_apt_proxy}"
    else
      (
        printf 'Acquire::http::Proxy http://%s:%s\n' "${url}" "${port}"
        printf 'Acquire::https::Proxy http://%s:%s\n' "${url}" "${port}"
      ) >>"${source_apt_proxy}"
    fi
    sudo mv "${source_apt_proxy}" "${dest_apt_proxy}"
  fi

  # git
  print_info "==> .gitconfig"
  if grep -q 'proxy' "${HOME}/.gitconfig"; then
    print_notice 'Already set up.'
  else
    if [ -n "${user}" ]; then
      git config --global http.proxy "http://${user}:${password}@${url}:${port}"
      git config --global https.proxy "http://${user}:${password}@${url}:${port}"
    else
      git config --global http.proxy "http://${url}:${port}"
      git config --global https.proxy "http://${url}:${port}"
    fi
  fi

  print_done
}

main
