## migration vm

http://cloudscraper.migrate2iaas.com/faq

## Digitalocean

выключи автоматический бэкап - по три часа в неделю включает ОС. 5 баксов в месяц
нет импорта ВМ

## rackspace


rackspace-mon
```bash
curl https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc | tee -a linux.asc
rpm --import linux.asc 
cat >> rackspace_mon.repo
[rackspace]
name=Rackspace Monitoring
baseurl="http://stable.packages.cloudmonitoring.rackspace.com/centos-6-x86_64" 
enabled=0

ln -s /distr/rackspace_mon.repo /etc/yum.repos.d/rackspace_mon.repo

yum update
yum repolist
cat rackspace_mon.repo 

yum install rackspace-monitoring-agent
rackspace-monitoring-agent --setup
/etc/init.d/rackspace-monitoring-agent stop
chkconfig rackspace-monitoring-agent off
```

## amazon

### postgres

```bash
mcedit /etc/yum.repos.d/amzn-updates.repo
mcedit /etc/yum.repos.d/amzn-main.repo

#priority=10
exclude=postgres*

wget http://mirror.yandex.ru/centos/6.5/os/i386/Packages/centos-release-6-5.el6.centos.11.1.i686.rpm
extract & cp
/etc/centos-release
/etc/pki/*
/etc/rpm/*

rpm --nodeps -ivh pgdg-centos91-9.1-4.noarch.rpm
```

### ssh amazon ec2

```bash
chmod 400 17062016pair.pem
ssh-keygen -y -f 17062016pair.pem > 17062016pair.pem.pub
chmod 400 17062016pair.pem.pub
ssh -i "17062016pair.pem" ec2-user@ec2-54-172-136-194.compute-1.amazonaws.com
```

### cli

 * [describe instances script formatting output:](https://github.com/epheph/fec2din)
 * [readme:](http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/set-up-ec2-cli-linux.html)
 * в S3 для удаления корзин есть lifecycle rules -- expiration
	```bash
	yum install python-pip
	pip install awscli

	aws s3 rb s3://MyBucket --force
	aws s3 ls
	```
 * [keypair create:](https://console.aws.amazon.com/iam/home?#security_credential)
 * [key file:](https://console.aws.amazon.com/ec2/v2/home?region=eu-west-1#KeyPairs:)

### vm export

at S3 bucket add to vm-import-export@amazon.com list, upload/download, view permissions

```bash
~> ec2-create-instance-export-task i-abe820eb -e Vmware -f vmdk -b svv-bucket-ireland-1 
EXPORTTASK      export-i-fgnb7lid               active          i-abe820eb      vmware  vmdk            svv-bucket-ireland-1    export-i-fgnb7lid.vmdk
You may monitor the progress of this task by running ec2-describe-export-tasks.

~> ec2-describe-export-tasks
EXPORTTASK      export-i-fg0rjhta               completed               i-abe820eb      vmware  vmdk    ova     svv-bucket-ireland-1    export-i-fg0rjhta.ova
EXPORTTASK      export-i-fgnb7lid               completed               i-abe820eb      vmware  vmdk            svv-bucket-ireland-1    export-i-fgnb7lid.vmdk
```
### vm import

workstation - file - export to ovf
```bash
~> ec2-import-instance \
-t m3.medium /path/vm/centos_disk1.vmdk \
-f vmdk \
-p Linux \
-z eu-west-1a \
--subnet subnet-87e11be2 \
-o _O_KEY_ \
-w _W_KEY_ \
--instance-initiated-shutdown-behavior stop \
-b svv-bucket-ireland-1 \
-a x86_64 \ 
-v --no-upload

Requesting volume size: 20 GB
TaskType        IMPORTINSTANCE  TaskId  import-i-fghqogfd       ExpirationTime  2014-06-11T19:45:24Z    Status  active  StatusMessage   Pending InstanceID      i-abe820eb
DISKIMAGE       DiskImageFormat VMDK    DiskImageSize   958827520       VolumeSize      20      AvailabilityZone        eu-west-1a      ApproximateBytesConverted       0       Status  active  StatusMessage      Pending : Downloaded 0
Creating new manifest at svv-bucket-ireland-1/5cff5bf1-8a23-467e-97bb-9158dd8636cb/centos_disk1.vmdkmanifest.xml
Uploading the manifest file
Uploading 958827520 bytes across 92 parts
0% |--------------------------------------------------| 100%
   |==================================================|
Done
Average speed was 2,035 MBps
The disk image for import-i-fghqogfd has been uploaded to Amazon S3
where it is being converted into an EC2 instance.  You may monitor the
progress of this task by running ec2-describe-conversion-tasks.  When
the task is completed, you may use ec2-delete-disk-image to remove the
image from S3.


~> ec2-describe-conversion-tasks
TaskType        IMPORTINSTANCE  TaskId  import-i-fghqogfd       ExpirationTime  2014-06-11T19:45:24Z    Status  active  StatusMessage   Pending InstanceID      i-abe820eb
DISKIMAGE       DiskImageFormat VMDK    DiskImageSize   958827520       VolumeSize      20      AvailabilityZone        eu-west-1a      ApproximateBytesConverted       958825616       Status  active  StatusMessage      Progress: 50%

~> ec2-describe-conversion-tasks
TaskType        IMPORTINSTANCE  TaskId  import-i-fghqogfd       ExpirationTime  2014-06-11T19:45:24Z    Status  active  StatusMessage   Progress: 18%   InstanceID      i-abe820eb
DISKIMAGE       DiskImageFormat VMDK    DiskImageSize   958827520       VolumeId        vol-c1ba3fc6    VolumeSize      20      AvailabilityZone        eu-west-1a      ApproximateBytesConverted       958825616  Status  completed


~> ec2-delete-disk-image -t import-i-fghqogfd -o _O_KEY_ -w _W_KEY_ 
The task import-i-fghqogfd is still active. Use --ignore-active-task to force the deletion.

~> ec2-describe-instances | grep -iE 'name|instance'
INSTANCE        i-0d37fa4d      ami-678c4c10            ip-172-31-25-223.eu-west-1.compute.internal     stopped amazon_my_eu1a_keys     0               t1.micro        2014-05-31T19:37:19+0000        eu-west-1a                 windows monitoring-disabled             172.31.25.223   vpc-d4c22eb1    subnet-87e11be2 ebs                                     hvm     xen     BMaze1401565039110      sg-b069afd5default false
TAG     instance        i-0d37fa4d      Name    win2008_x64_vpc_eu-west-1a
INSTANCE        i-abe820eb      ami-cf9f50b8            ip-172-31-20-247.eu-west-1.compute.internal     stopped         0               m3.medium       2014-06-04T19:45:24+0000        eu-west-1a        monitoring-disabled              172.31.20.247   vpc-d4c22eb1    subnet-87e11be2 ebs   

```

```bash
ec2-import-instance 
-t m1.large /mnt/wdc500/vm/cloudscraper-images/2013-11-30/C.VHD 
-f VHD -p Windows 
-z us-east-1c 
--subnet vpc-51b8b033 
-o AKIAJFVNMRSGULXJU3EQ 
-w MkM7vZUuWg3uBLeEUnEBjhzxyhNFKkhrBCDu5bKm 
--instance-initiated-shutdown-behavior stop 
-b us-east-1-buck-bsk 
-a x86_64 
-v --no-upload
```

### ec2-api-tools

```bash
#common:
export EC2_HOME="/distr/vps/amazon/ec2-api-tools-1.6.14.1"
export PATH=${PATH}:${EC2_HOME}/bin

#personal:
export AWS_ACCESS_KEY=_O_KEY_
export AWS_SECRET_KEY=_W_KEY_
export EC2_URL=https://ec2.us-east-1.amazonaws.com
```

### java

```bash
~> file $(which java)
/usr/bin/java: symbolic link to '/etc/alternatives/java'

This location is the actual binary (notice that it is listed as an executable). 
The Java home directory is where bin/java lives; in this example, 
the Java home directory is /usr/lib/jvm/java-7-openjdk-amd64/jre.
    $ export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre"
    You can verify your JAVA_HOME setting using this command.
    $ $JAVA_HOME/bin/java -version
    $ ls -al ~ | grep profile

Tell the CLI Tools Where They Live

~> export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.6.14.0  
~> export PATH=$PATH:$EC2_HOME/bin 

Tell the CLI Tools Who You Are

Every time you issue a command, you must specify your access keys using the --aws-access-key and
 --aws-secret-key (or -O and -W) options. Alternatively, you might find it easier to store your 
access keys using the following environment variables:

~> export AWS_ACCESS_KEY=your-aws-access-key-id 
~> export AWS_SECRET_KEY=your-aws-secret-key

Verify the Tools Setup

~> ec2-describe-regions

(Optional) Set the Region

By default, the Amazon EC2 CLI tools use the US East (Northern Virginia) region (us-east-1) 
with the ec2.us-east-1.amazonaws.com service endpoint URL.

~> export EC2_URL=https://ec2.us-east-1.amazonaws.com

```
