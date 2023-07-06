# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

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
