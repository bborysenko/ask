Vagrant.configure("2") do |config|
  config.vm.box = "bento/opensuse-leap-42.1"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.sudo = true
  end
end
