#!/bin/bash

yes_or_no_select() {
  local answer
  read -rp "(Y/n): " answer
  case "${answer}" in
  [nN]*)
    return 1
    ;;
  *)
    return 0
    ;;
  esac
}

main() {
  set -euo pipefail
  echo '==> Setup proxy ...'

  local url port user password user_auth_yn collect_yn
  echo "http://<URL>:<Port>"
  read -rp "URL: " url
  read -rp "Port: " port
  echo ''

  echo -n "==> User Authentication? "
  yes_or_no_select
  user_auth_yn=$?

  case "$user_auth_yn" in
  0)
    read -rp "User: " user
    read -rsp "Password: " password
    echo ''
    ;;
  1) ;;
  *)
    echo 'abort.'
    exit 1
    ;;
  esac
  echo ''

  echo "==> Proxy setting entered"
  echo "http://${url}:${port}"
  [ "${user_auth_yn}" == '0' ] &&
    echo -e "User: ${user}\nPassword: ********\n"

  echo -n "Collect?"
  yes_or_no_select
  collect_yn=$?

  case "${collect_yn}" in
  0) ;;
  *)
    echo "abort."
    exit 0
    ;;
  esac
  echo ''

  # wget
  echo "==> ~/.wgetrc"
  echo "http_proxy=http://${url}:${port}" >>"${HOME}/.wgetrc"
  if [ "${user_auth_yn}" == '0' ]; then
    echo "proxy_user=${user}" >>"${HOME}/.wgetrc"
    echo "proxy_password=${password}" >>"${HOME}/.wgetrc"
  fi

  # curl
  echo "==> ~/.curlrc"
  echo "proxy=http://${url}:${port}" >>"${HOME}/.curlrc"
  if [ "${user_auth_yn}" == '0' ]; then
    echo "proxy-user=${user}:${password}" >>"${HOME}/.curlrc"
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

  if [ "${user_auth_yn}" == '0' ]; then
    echo "http_proxy=http://${user}:${password}@${url}:${port}" >>"${bashrc}"
    echo "https_proxy=http://${user}:${password}@${url}:${port}" >>"${bashrc}"
  else
    echo "http_proxy=http://${url}:${port}" >>"${bashrc}"
    echo "https_proxy=http://${url}:${port}" >>"${bashrc}"
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

  if [ "${user_auth_yn}" == '0' ]; then
    echo "http_proxy=http://${user}:${password}@${url}:${port}" >>"${zshrc}"
    echo "https_proxy=http://${user}:${password}@${url}:${port}" >>"${zshrc}"
  else
    echo "http_proxy=http://${url}:${port}" >>"${zshrc}"
    echo "https_proxy=http://${url}:${port}" >>"${zshrc}"
  fi

  # apt
  echo "==> /etc/apt/apt.conf.d/proxy.conf"
  local apt_proxy
  apt_proxy="${HOME}/proxy.conf"
  touch "${apt_proxy}"
  if [ "${user_auth_yn}" == '0' ]; then
    echo "Acquire::http::Proxy http://${user}:${password}@${url}:${port}" >>"${apt_proxy}"
    echo "Acquire::http::Proxy http://${user}:${password}@${url}:${port}" >>"${apt_proxy}"
  else
    echo "Acquire::http::Proxy http://${url}:${port}" >>"${apt_proxy}"
    echo "Acquire::http::Proxy http://${url}:${port}" >>"${apt_proxy}"
  fi
  sudo mv "${apt_proxy}" /etc/apt/apt.conf.d/
}

main
