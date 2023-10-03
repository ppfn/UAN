# UrbanAppNet Repository

## How to deploy the UrbanAppNet infrastructure

### Prerequisites
- [Vagrant](https://www.vagrantup.com/) 
- [Git](https://git-scm.com/)

### 1. Clone the repository
```bash
git clone https://github.com/ppfn/UAN.git
```

### 2. Modify the Vagrantfile if needed
```ruby
[...]
SUBNET = '192.168.100' # The subnet used by the virtual machines
LINUX_SERVERS_BOX = 'debian/bookworm64' # The box used for the Linux servers
[...]
```

### 3. Start the virtual machines
```bash
vagrant up
```

:warning: The first time you run this command, it will take a while to download the boxes.

:warning: The Vagrantfile is set to use a public network for the virtual machine. This network has to be configured beforehand.

### 4. You can provision the virtual machines if needed
```bash
vagrant provision
```
