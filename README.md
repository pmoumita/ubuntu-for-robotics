```
sudo apt update
sudo apt upgrade
```

#Install git
```
sudo apt install git
```

#Installing Google Chrome

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
```

#Nvidia+CUDA+cuDNN Installation

```
sudo apt install nvidia-smi nvidia-384
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb 
```

if prompted to install the key-
Run the suggested command, for me it was
```
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
```
```
sudo apt-get update
sudo apt-get install cuda
rm -rf cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
```

#Check for CUDA version

```
echo 'export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}' >> ~/.bashrc
sudo apt install nvidia-cuda-toolkit
nvcc --version
```

# Cloning the repository 
```
git clone https://github.com/akathpal/ubuntu-for-robotics.git
cd ubuntu-for-robotics/
```

#Install ROS
 
```
chmod u+x install_ros.sh
./install_ros.sh
```

# Additional Resources

## Update a forked repository with git rebased
https://medium.com/@topspinj/how-to-git-rebase-into-a-forked-repo-c9f05e821c8a
