
# Configure ssh server with encrypted home directory

date: 2015-07-17


The following instructions are to set up an ssh server on Ubuntu linux with an encrypted home directory.

Throughout `<username>` refers to an actual username like `phil`.

Install OpenSSH server:

```bash
sudo apt-get install openssh-server
```

Create a backup of `sshd_config` (NOT `ssh_config`, note the `d`)

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
```

Configure `sshd_config` to initially accept password logins:

```bash
sudo chmod a-w /etc/ssh/sshd_config.factory-defaults
sudo gedit /etc/ssh/sshd_config
```

Change the line `#PasswordAuthentication yes` to read `PasswordAuthentication yes` (i.e. remove the #) and only allow certain users:

```bash
PasswordAuthentication yes
AllowUsers <username>
```

Finally tell the configuration file to look in `/etc/ssh/username/authorized_keys` for client keys.
The default is to look in `~/.ssh/` which is no good because this is encrypted until you've logged in!
Change `AuthorizedKeysFile` to:

```bash
AuthorizedKeysFile    /etc/s../_static/authorized_keys
```

Close `gedit`.
Restart the ssh server with:

```bash
sudo service ssh restart
```

Next create the `authorized_keys` file and give it the appropriate permissions:

```bash
sudo mkdir /etc/ssh/<username>/
sudo chown username /etc/ssh/<username>
sudo chmod 755 /etc/ssh/<username>
sudo touch /etc/ssh/<username>/authorized_keys
sudo chown username /etc/ssh/<username>/authorized_keys
sudo chmod 644 /etc/ssh/<username>/authorized_keys
```

Then copy the client's public key to `authorized_keys`.
The easiest way to do that is to ssh in to the server (which is why we allowed password logins earlier) and do it from there.
So from the client:

```bash
nano ~/.ssh/id_rsa.pub
```

Copy the key to the clipboard then:

```bash
ssh username.host.tld
```

Enter log in password when prompted, then:

```bash
nano /etc/ssh/username/authorized_keys  # Paste the key here and save
```

Then logout:

```bash
logout
```

Disable password logins from `/etc/ssh/sshd_config` and restart the ssh server (`sudo service ssh restart` from the server).
Log in is now done using the ssh keys and without prompting for a password.
The client will prompt to see if the public key fingerprint sent from the server is correct and to add it to the white list.
Check it's right by running `ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key` on the server.

## Sources:

- https://help.ubuntu.com/community/SSH/OpenSSH/Keys
- https://help.ubuntu.com/community/SSH/OpenSSH/Configuring
- http://stackoverflow.com/questions/14301519/how-to-copy-pub-file-to-ssh-authoized-key>
- http://ubuntuforums.org/showthread.php?t=789301
