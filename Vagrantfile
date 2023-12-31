# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

hosts = <<~EOS_VAGRANT
  cat << EOS >> /etc/hosts
  192.168.57.201 pleroma1.local
  192.168.57.202 pleroma2.local
  192.168.57.203 pleroma3.local
  EOS
EOS_VAGRANT

Vagrant.configure('2') do |config|
  config.vm.box = "almalinux/8"
  config.vm.box_version = "8.8.20230524"
  config.ssh.insert_key = false

  config.vm.provider 'libvirt' do |provider|
    provider.driver = 'kvm'
    provider.memory = 1024
    provider.cpus = 1
  end

  (1..3).each do |i|
    config.vm.define "pleroma#{i}" do |n|
      n.vm.hostname = "pleroma#{i}"
      n.vm.network 'private_network', ip: "192.168.57.20#{i}"
      n.vm.synced_folder '.', '/vagrant', create: true, owner: "vagrant", group: "vagrant", type: "sshfs"
      n.vm.provision :shell, inline: 'setenforce 0'
      n.vm.provision :shell, inline: hosts
      n.vm.provision :shell, path: 'scripts/download_pleroma_source.sh'
      n.vm.provision :shell, path: 'scripts/extract_pleroma_source.sh'
      n.vm.provision :shell, path: 'scripts/setup_docker.sh'
      n.vm.provision :shell, path: 'scripts/setup_pleroma.sh'
      n.vm.provision :shell, path: 'scripts/setup_certificates.sh'
      n.vm.provision :shell, path: 'scripts/setup_nginx.sh'
    end
  end

  config.vm.define "k6" do |n|
    n.vm.provider 'libvirt' do |provider|
      provider.driver = 'kvm'
      provider.memory = 4096
      provider.cpus = 4
    end
    n.vm.hostname = "k6"
    n.vm.network 'private_network', ip: '192.168.57.100'
    n.vm.synced_folder '.', '/vagrant', create: true, owner: 'vagrant', group: 'vagrant', type: 'sshfs'
  end

  config.vm.define "minio" do |n|
    n.vm.provider 'libvirt' do |provider|
      provider.driver = 'kvm'
      provider.memory = 4096
      provider.cpus = 4
    end
    n.vm.hostname = "minio"
    n.vm.network 'private_network', ip: "192.168.57.254"
    n.vm.synced_folder '.', '/vagrant', create: true, owner: "vagrant", group: "vagrant", type: "sshfs"
  end
end
