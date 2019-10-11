# tf-custom-plugin
TF - using custom plugin

# Purpose
This repository provides demo code for running Terraform in Vagrant environment with custom plugin.

# Requirements

This repository assumes general knowledge about Terraform, if not, please get yourself accustomed first by going through [getting started guide for Terraform](https://learn.hashicorp.com/terraform?track=getting-started#getting-started). We also going to use Vagrant with VirtualBox

To learn more about the mentioned above tools and technologies -  please check section [Technologies near the end of the README](#technologies)

# How to use
- Download copy of the code (*clone* in Git terminology) - go to the location of your choice (normally some place in home folder) and run in terminal; in case you are using alternative Git Client - please follow appropriate instruction for it and download(*clone*) [this repo](https://github.com/Galser/tf-custom-plugin.git). 
```
git clone https://github.com/Galser/tf-custom-plugin.git
```

- Previous step should create the folder that contains a copy of the repository. Default name is going to be the same as the name of repository e.g. `tf-custom-plugin`. Locate and open it.
    ```
    cd tf-custom-plugin
    ```
- To create and provision virtual machine with Vagrant - execute from command line :
    ```
    vagrant up
    ```
    > Command above will utilize settings from [Vagrantfile](Vagrantfile) prepared in this repo
 
    First-time start can take some time, as Vagrant need to download and import box image, and you can see something like this :
    ```
    Bringing machine 'default' up with 'virtualbox' provider...
    ==> default: Importing base box 'galser/ubuntu-1804-vbox'...
    ==> default: Matching MAC address for NAT networking...
    ==> default: Checking if box 'galser/ubuntu-1804-vbox' version '0.0.1' is up to date...
    ==> default: Setting the name of the VM: tf-custom-plugin_default_1570805222296_65024
    ```
    then you should see *start of provisioning* : 
    ```
    ...
    ==> default: Mounting shared folders...
        default: /vagrant => /Users/andrii/labs/skills/tf-custom-plugin
    ==> default: Running provisioner: file...
        default: scripts => $HOME/scripts
    ==> default: Running provisioner: file...
        default: infra => $HOME/infra
    ==> default: Running provisioner: shell...
        default: Running: /var/folders/nw/hlt5_kpd5lzb78xrft48ynqm0000gp/T/vagrant-shell20191011-69841-mb2qn1.sh
        default: /usr/bin/wget
        default: 2019-10-11 11:06:42 URL:https://dl.google.com/go/go1.13.linux-amd64.tar.gz [120050424/120050424] -> "
    ...   
    ```
    After there is an *installation phase for the set of tools (wget, Git, go)*
    Then - *downloading of the custom plugin* and later in the output there should be lines :
    ```
    default: ==> Checking that code complies with gofmt requirements...
    default: go install
    default: go: downloading github.com/hashicorp/terraform v0.0.0-20180620183908-ec998a21bc95
    ```
    That's start of the *compilation of plugin*.
    And now, at the very end you should see output similar to the one below :
    ```
    default: data.extip.external_ip: Refreshing state...
    default: null_resource.example: Creating...
    default: null_resource.example: Creation complete after 0s (ID: 591339294531344966)
    default: 
    default: Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    default: 
    default: Outputs:
    default: external_ip = 77.162.119.95
    ```
    Where `77.162.119.95` is an external IP-address of the machine where you running the test, sure it can be different. And this output confirms that plugin had been successfully downloaded, compiled, installed and used. 
- To completely destroy the VM and free up all your system resource (CPU, memory) you will need to give Vagrant instruction to do so - execute from command line :
    ```
    vagrant destroy
    ```
    Next you should see the question on a new line :
    ``` 
    default: Are you sure you want to destroy the 'default' VM? [y/N]
    ```
    Answer `y` from keyboard, and you are good to go
- See run log example at the end of the readme - [here](#run-logs)

This concludes the "How To Use" section, thank you.


# Technologies

1. **To download the content of this repository** you will need **git command-line tools**(recommended) or **Git UI Client**. To install official command-line Git tools please [find here instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) for various operating systems. 
2. **For managing infrastructure** we using Terraform - open-source infrastructure as a code software tool created by HashiCorp. It enables users to define and provision a data center infrastructure using a high-level configuration language known as Hashicorp Configuration Language, or optionally JSON. More you encouraged to [learn here](https://www.terraform.io). 
3. **This project for virtualization** recommends **VirtualBox**, download the binaries for your [platform here](https://www.virtualbox.org/wiki/Downloads) and then follow [instructions for installation](https://www.virtualbox.org/manual/ch02.html)
4. **For managing VM** (virtual machines), we are going to use **Vagrant**. To install **Vagrant** , please follow instructions here : [official Vargant installation manual](https://www.vagrantup.com/docs/installation/)

# TODO



# DONE

- [x] Setup a Vagrantfile that installs golang
- [x] Create a sample project, ie null provider
- [x] Compile a custom plugin
- [x] Copy the custom plugin to the required path
- [x] Update main.tf to use the custom plugin
- [x] Test it works.


# Run logs

> Note Verbose part of the output of wget / apt-get / go install is removed from the log below, to save space 
```
vagrant up      
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'galser/ubuntu-1804-vbox'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'galser/ubuntu-1804-vbox' version '0.0.1' is up to date...
==> default: Setting the name of the VM: tf-custom-plugin_default_1570805222296_65024
==> default: Fixed port collision for 22 => 2222. Now on port 2200.
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 22 (guest) => 2200 (host) (adapter 1)
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2200
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: 
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default: 
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Setting hostname...
==> default: Mounting shared folders...
    default: /vagrant => /Users/andrii/labs/skills/tf-custom-plugin
==> default: Running provisioner: file...
    default: scripts => $HOME/scripts
==> default: Running provisioner: file...
    default: infra => $HOME/infra
==> default: Running provisioner: shell...
    default: Running: /var/folders/nw/hlt5_kpd5lzb78xrft48ynqm0000gp/T/vagrant-shell20191011-67667-psuyx0.sh
    default: /usr/bin/wget
    default: 2019-10-11 10:47:45 URL:https://dl.google.com/go/go1.13.linux-amd64.tar.gz [120050424/120050424] -> "/tmp/go1.13.linux-amd64.tar.gz" [1]
    default: /usr/bin/wget
    default: Reading package lists...
    default: Building dependency tree...
    default: Reading state information...
    default: Suggested packages:
    default:   zip
    default: The following NEW packages will be installed:
    default:   unzip
    default: 0 upgraded, 1 newly installed, 0 to remove and 45 not upgraded.
    ...
    default: Setting up unzip (6.0-21ubuntu1) ...
    default: Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
    default: 2019-10-11 10:47:53 URL:https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip [12569267/12569267] -> "/tmp/terraform_0.11.14_linux_amd64.zip" [1]
    default: Terraform v0.11.14
    default: Your version of Terraform is out of date! The latest version
    default: is 0.12.10. You can update by downloading from www.terraform.io/downloads.html
    default: Reading package lists...
    default: Building dependency tree...
    default: Reading state information...
    default: The following additional packages will be installed:
    default:   git-man libcurl3-gnutls liberror-perl libnghttp2-14 librtmp1
    default: Suggested packages:
    default:   git-daemon-run | git-daemon-sysvinit git-doc git-el git-email git-gui gitk
    default:   gitweb git-cvs git-mediawiki git-svn
    default: The following NEW packages will be installed:
    default:   git git-man libcurl3-gnutls liberror-perl libnghttp2-14 librtmp1
    default: 0 upgraded, 6 newly installed, 0 to remove and 45 not upgraded.
    default: Need to get 5,077 kB of archives.
    ...
    default: ==> Checking that code complies with gofmt requirements...
    default: go install
    default: go: downloading github.com/hashicorp/terraform v0.0.0-20180620183908-ec998a21bc95
    ...
    default: go: finding github.com/mitchellh/hashstructure v1.0.0
    default: 
    default: Initializing provider plugins...
    default: - Checking for available provider plugins on https://releases.hashicorp.com...
    default: - Downloading plugin for provider "null" (2.1.2)...
    default: The following providers do not have any version constraints in configuration,
    default: so the latest version was installed.
    default: To prevent automatic upgrades to new major versions that may contain breaking
    default: changes, it is recommended to add version = "..." constraints to the
    default: corresponding provider blocks in configuration, with the constraint strings
    default: suggested below.
    default: * provider.null: version = "~> 2.1"
    default: Terraform has been successfully initialized!
    default: 
    default: You may now begin working with Terraform. Try running "terraform plan" to see
    default: any changes that are required for your infrastructure. All Terraform commands
    default: should now work.
    default: If you ever set or change modules or backend configuration for Terraform,
    default: rerun this command to reinitialize your working directory. If you forget, other
    default: commands will detect it and remind you to do so if necessary.
    default: data.extip.external_ip: Refreshing state...
    default: null_resource.example: Creating...
    default: null_resource.example: Creation complete after 0s (ID: 1216176949762248972)
    default: 
    default: Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    default: 
    default: Outputs:
    default: external_ip = 77.162.119.95
```