#!/bin/env/bash
# powered by L4EROOR / KMB
# Date 26 agust 2025

# WARNA
R=$'\e[1;31m'
G=$'\e[1;32m'
Y=$'\e[1;33m'
B=$'\e[1;34m'
N=$'\e[0m'

# Efek Ketik
Ketik() {
  local text="$1"
  for ((i=0; i<${#text}; i++)); do                                                                                                       echo -ne "${text:$i:1}"
    sleep 0.01
  done
  echo
}

# INFO data ip Publik
ip_address=$(curl -s https://api.ipify.org)
# Mencari lokasi
kota=$(curl -s https://ipapi.co/$ip_address/city)
provinsi=$(curl -s https://ipapi.co/$ip_address/region)
negara=$(curl -s https://ipapi.co/$ip_address/country_name)
provider=$(curl -s https://ipapi.co/$ip_address/org)

# Info HP/DEVICE
MERK=$(getprop ro.product.marketname 2>/dev/null || echo "Unknown")
MFAC=$(getprop ro.product.manufacturer 2>/dev/null || echo "Unknown")
ANDROID=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")

# Cek installasi Package
command -v curl >/dev/null 2>&1 || { echo >&2 "curl tidak ditemukan. Install curl terlebih dahulu.\n => apt-get install curl "; exit>
command -v jq >/dev/null 2>&1 || { echo >&2 "jq tidak ditemukan. Install jq terlebih dahulu.\n => apt-get install jq "; exit 1; }
command -v toilet >/dev/null 2>&1 || { echo >&2 "toilet tidak ditemukan. Install toilet terlebih dahulu.\n => apt-get install toilet "; exit 1; }

clear
echo;toilet -f pagga "SELAMAT DATANG" -F border --metal
read -p "$(echo -e "$N [🔴🟢🟡]$B Input YOUR NAME $N═>> $G")" nama
[ -z "$nama" ] && nama="USER"

clear;echo -e "${N}"
Ketik "${R}╔$(printf '%.0s═' {1..46})╗"
Ketik "║$(printf '%16s')${N}USER : ${G}$nama$(printf '%*s' $((23-${#nama})) ' ')${R}║"
Ketik "╠${N}$(printf '%.0s═' {1..46})${R}╣"
Ketik "║ ${Y}YOUR IP   = ${G}$ip_address$(printf '%*s' $((33-${#ip_address})) ' ')${R}║"
Ketik "║ ${Y}LOKASI    = ${G}$kota, $provinsi, $negara$(printf '%*s' $((29-${#kota}-${#provinsi}-${#negara})) ' ')${R}║"
Ketik "║ ${Y}ISP ${G}$provider$(printf '%*s' $((42-${#provider}-1)) ' ')${R}║"
Ketik "╠${N}$(printf '%.0s═' {1..46})${R}╣"
Ketik "║ ${Y}Merk Device     : ${G}$MERK$(printf '%*s' $((27-${#MERK})) '')${R}║"
Ketik "║ ${Y}Android Version : ${G}$ANDROID ${N}[${B}$MFAC${N}]$(printf '%*s' $((25-${#MFAC}-${#ANDROID}-1)) '')${R}║"
Ketik "╚$(printf '%.0s═' {1..46})╝"
