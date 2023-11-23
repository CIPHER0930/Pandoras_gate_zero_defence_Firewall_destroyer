#!/bin/bash

# This script will open all ports on the target server and make them unfiltered.

# First, we need to find the IP address of the target server. We can do this by using the dig command:

target_ip=$(dig +short target_server A | head -n 1)

# Check if the dig command failed
if [ $? -ne 0 ]; then
  echo "Failed to determine target server IP address"
  exit 1
fi

# Now, we need to create a new file called open_ports.sh. We can do this by using the touch command:

touch open_ports.sh

# Check if the touch command failed
if [ $? -ne 0 ]; then
  echo "Failed to create open_ports.sh file"
  exit 1
fi

# Now, we need to open the open_ports.sh file in a text editor. We can do this by using the nano command:

nano open_ports.sh

# In the open_ports.sh file, we need to add the following lines:

#!/bin/bash

# This script will open all ports on the target server and make them unfiltered.

# Use the target IP address retrieved earlier

target_ip=$target_ip

# Now, we need to open all ports on the target server. We can do this by using the ufw allow all command:

ufw allow all to $target_ip

# Check if the ufw allow command failed
if [ $? -ne 0 ]; then
  echo "Failed to open ports on target server"
  exit 1
fi

# Finally, we need to make sure that the ports are unfiltered. We can do this by using the ufw status command:

ufw status

# The output of the ufw status command will be something like this:

Status: active
To Action From
  
22/tcp ALLOW Anywhere
80/tcp ALLOW Anywhere
443/tcp ALLOW Anywhere

# This means that all ports are open and unfiltered.

# Now, we need to save the open_ports.sh file and exit the text editor. We can do this by pressing Ctrl+X, then Y, then Enter.

# Now, we need to make the open_ports.sh file executable. We can do this by using the chmod +x open_ports.sh command:

chmod +x open_ports.sh

# Check if the chmod command failed
if [ $? -ne 0 ]; then
  echo "Failed to make open_ports.sh executable"
  exit 1
fi

# Now, we need to copy the open_ports.sh file to the target server. We can do this by using the scp command:

scp open_ports.sh target_ip:/tmp

# Check if the scp command failed
if [ $? -ne 0 ]; then
  echo "Failed to copy open_ports.sh to target server"
  exit 1
fi

# Now, we need to run the open_ports.sh file on the target server. We can do this by using the ssh command:

ssh target_ip 'bash /tmp/open_ports.sh'

# Check if the ssh command failed
if [ $? -ne 0 ]; then
  echo "Failed to run open_ports.sh on target server"
  exit 1
fi

# The open_ports.sh file will now open all ports on the target server and make them unfiltered.

# You can now connect to the target server using any port.
