Lost-key Recovery
=================

==> Create an Instance with a keypair as Duplicate and Instance name also Duplicate

==> Create another instance with keypair as Original and Instance name also Original

==> After the duplicate instance come into running state, delete the duplicate keypair in downloads

==> connect the both instances with git bash, original will connect and duplicate will not connect.

==> Stop the duplicate instance and go into volumes section and give names for the volumes.

==> detach the volume of duplicate server.

==> Stop the Original server and attach the volume of duplicate server to Original Server.

==> Start the Original server and connect with git bash and Execute the below commands

lsblk

mkdir /mnt/recovery

mount /dev/xvdf1 /mnt/recovery

cat /home/ubuntu/.ssh/authorized-keys >> /mnt/recovery/home/ubuntu/.ssh/authorized-keys

umount /mnt/recovery

exit

==> goto volumes and detach the volume of duplicate server from Original Server and attach it to the duplicate server but the device name as "dev/sda1" check before attachment otherwise it would not work.

==> Stop the Original Instance. 

==> Open gitbash and do the ssh connection for duplicate server using this command

	ssh -i original.pem ubuntu@<public ip>