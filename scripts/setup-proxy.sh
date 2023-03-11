#!/bin/bash

main() {
  set -euo pipefail

  local url port user password yn

  echo '==> Setup proxy ...'
  echo "http://<URL>:<Port>"
  read -rp "URL: " url
  read -rp "Port: " port
  echo ''

  echo "==> User Authentication? (Press enter to skip)"
  read -rp "User: " user
  [ -n "${user}" ] &&
    read -rsp "Password" password
  echo -e "\n"

  read -rp "Collect? (Y/n)"
  case "$yn" in
  [nN]*)
    echo 'abort.'
    exit 0
    ;;
  *) ;;
  esac
  echo ''

  # wget
  echo "==> ~/.wgetrc"
  local wgetrc="${HOME}/.wgetrc"
  touch "${wgetrc}"
  if grep -q 'http_proxy=' "${wgetrc}"; then
    echo "Already set up."
  else
    echo "http_proxy=http://${url}:${port}" >>"${HOME}/.wgetrc"
    [ -n "${user}" ] && (
      echo "proxy_user=${user}"
      echo "proxy_password=${password}"
    ) >>"${wgetrc}"
  fi

  # curl
  echo "==> ~/.curlrc"
  local curlrc="${HOME}/.curlrc"
  touch "${curlrc}"
  if grep -q 'proxy=' "${curlrc}"; then
    echo "Already set up."
  else
    echo "proxy=http://${url}:${port}" >>"${curlrc}"
    [ -n "${user}" ] &&
      echo "proxy-user=${user}:${password}" >>"${curlrc}"

  fi

  # bash
  local bashrc
  if [ -f "${HOME}/.bashrc.local" ]; then
    echo "==> ~/.bashrc.local"
    bashrc="${HOME}/.bashrc.local"
  else
    echo "==> ~/.bashrc"
    bashrc="${HOME}/.bashrc"
  fi

  if grep -q 'http_proxy=' "${bashrc}"; then
    echo 'Already set up.'
  else
    if [ -n "${user}" ]; then
      (
        echo "http_proxy=http://${user}:${password}@${url}:${port}"
        echo "https_proxy=http://${user}:${password}@${url}:${port}"
      ) >>"${bashrc}"
    else
      (
        echo "http_proxy=http://${url}:${port}"
        echo "https_proxy=http://${url}:${port}"
      ) >>"${bashrc}"
    fi
  fi

  # zsh
  local zshrc
  if [ -f "${HOME}/.zshrc.local" ]; then
    echo "==> ~/.zshrc.local"
    zshrc="${HOME}/.zshrc.local"
  else
    echo "==> ~/.zshrc"
    zshrc="${HOME}/.zshrc"
  fi

  if grep -q 'http_proxy=' "${zshrc}"; then
    echo 'Already set up.'
  else
    if [ -n "${user}" ]; then
      (
        echo "http_proxy=http://${user}:${password}@${url}:${port}"
        echo "https_proxy=http://${user}:${password}@${url}:${port}"
      ) >>"${zshrc}"
    else
      (
        echo "http_proxy=http://${url}:${port}"
        echo "https_proxy=http://${url}:${port}"
      ) >>"${zshrc}"
    fi
  fi

  # apt
  echo "==> /etc/apt/apt.conf.d/proxy.conf"
  local source_apt_proxy dest_apt_proxy
  source_apt_proxy="${HOME}/proxy.conf"
  dest_apt_proxy="/etc/apt/apt.conf.d/proxy.conf"
  if [ -f "${dest_apt_proxy}" ]; then
    echo 'Already set up.'
  else
    touch "${source_apt_proxy}"
    if [ -n "${user}" ]; then
      (
        echo "Acquire::http::Proxy http://${user}:${password}@${url}:${port}"
        echo "Acquire::http::Proxy http://${user}:${password}@${url}:${port}"
      ) >>"${source_apt_proxy}"
    else
      (
        echo "Acquire::http::Proxy http://${url}:${port}"
        echo "Acquire::http::Proxy http://${url}:${port}"
      ) >>"${source_apt_proxy}"
    fi
  fi
  sudo mv "${source_apt_proxy}" "${dest_apt_proxy}"

  # git
  echo "==> .gitconfig"
  if grep -q 'proxy' "${HOME}/.gitconfig"; then
    echo 'Already set up.'
  else
    if [ -n "${user}" ]; then
      git config --global http.proxy "http://${user}:${password}@${url}:${port}"
      git config --global https.proxy "http://${user}:${password}@${url}:${port}"
    else
      git config --global http.proxy "http://${url}:${port}"
      git config --global https.proxy "http://${url}:${port}"
    fi
  fi
}

main
