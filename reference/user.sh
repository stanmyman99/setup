
# ---------------------------------------------------------------
# User management reference
# ---------------------------------------------------------------

# Add a new user
sudo useradd -m Stan
sudo passwd Stan
sudo usermod -a -G sudo Stan

# Delete a user
sudo deluser --remove-home Stan
