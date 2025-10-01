#!/bin/bash
# Script konfigurasi otomatis jaringan GNS3

echo "=== Mulai instalasi tools dasar ==="
apt-get update -y
apt-get install -y iproute2 iputils-ping net-tools tcpdump wget curl nmap iptables

echo "=== Konfigurasi Router (Eru) ==="
if [[ $(hostname) == "Eru" ]]; then
    # Konfigurasi interface
    auto eth0
    iface eth0 inet dhcp

    auto eth1
    iface eth1 inet static
        address 192.228.1.1
        netmask 255.255.255.0

    auto eth2
    iface eth2 inet static
        address 192.228.2.1
        netmask 255.255.255.0

    # Tambahkan ke .bashrc agar otomatis setelah restart
    echo "iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.228.0.0/16" >> /root/.bashrc
    echo "echo nameserver 192.168.122.1 > /etc/resolv.conf" >> /root/.bashrc
    
    echo "Router Eru siap digunakan."
fi

echo "=== Konfigurasi Client ==="
if [[ $(hostname) == "Manwe" ]]; then
    auto eth0
    iface eth0 inet static
        address 192.228.1.2
        netmask 255.255.255.0
        gateway 192.228.1.1
    chmod +x /root/traffic.sh
    echo "Client Manwe siap."
fi

if [[ $(hostname) == "Melkor" ]]; then
    auto eth0
    iface eth0 inet static
        address 192.228.1.3
        netmask 255.255.255.0
        gateway 192.228.1.1
    echo "Client Melkor siap."
fi

if [[ $(hostname) == "Varda" ]]; then
    auto eth0
    iface eth0 inet static
        address 192.228.2.2
        netmask 255.255.255.0
        gateway 192.228.1.1
    echo "Client Varda siap."
fi

if [[ $(hostname) == "Ulmo" ]]; then
    auto eth0
    iface eth0 inet static
        address 192.228.2.3
        netmask 255.255.255.0
        gateway 192.228.1.1
    echo "Client Ulmo siap."
fi

echo "=== Konfigurasi selesai ==="
