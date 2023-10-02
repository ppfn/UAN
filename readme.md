# UrbanAppNet Repository

## How to deploy the UrbanAppNet infrastructure

### Prerequisites
- [Vagrant](https://www.vagrantup.com/) 
- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/)

### 1. Clone the repository
```bash
git clone https://github.com/ppfn/UAN.git
```

### 2. Modify the Vagrantfile if needed
```ruby
[...]
PROVIDER = 'hyperv' # 'virtualbox' or 'hyperv'
SUBNET = '192.168.100' # The subnet used by the virtual machines
LINUX_SERVERS_BOX = 'debian/bookworm64' # The box used for the Linux servers
LINUX_PCS_BOX = 'debian/bookworm64' # The box used for the Linux PCs
[...]
```

### 3. Start the virtual machines
```bash
vagrant up --provider=<PROVIDER>
```
Where `<PROVIDER>` is the provider specified in the Vagrantfile (e.g. `hyperv` or `virtualbox`)

### 4. You can provision the virtual machines if needed
```bash
vagrant provision
```
