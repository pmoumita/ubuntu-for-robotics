```
sudo apt update
sudo apt upgrade
```

## Install git
```
sudo apt install git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

## Installing Google Chrome

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
```

## Nvidia+CUDA+cuDNN Installation

```
sudo apt install nvidia-smi nvidia-384
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb 
```

* If prompted to install the key, run the suggested command
For me, it was
```
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
```

```
sudo apt-get update
sudo apt-get install cuda
rm -rf cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
```

## Check for CUDA version

```
echo 'export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}' >> ~/.bashrc
sudo apt install nvidia-cuda-toolkit
nvcc --version
```

## Cloning the repository 
```
git clone https://github.com/akathpal/ubuntu-for-robotics.git
cd ubuntu-for-robotics/
```

## Install ROS
 
```
chmod u+x install_ros.sh
bash install_ros.sh
```

## Install CuDNN:
wget https://s3.amazonaws.com/open-source-william-falcon/cudnn-9.0-linux-x64-v7.1.tgz  
sudo tar -xzvf cudnn-9.0-linux-x64-v7.1.tgz  
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
rm -rf cudnn-9.0-linux-x64-v7.1.tgz

COpy to .bashrc

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda
export PATH=$PATH:/usr/local/cuda/bin

## Install miniconda

```
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh   

# press s to skip terms   

# Do you approve the license terms? [yes|no]
# yes

# Miniconda3 will now be installed into this location:
# accept the location

# Do you wish the installer to prepend the Miniconda3 install location
# to PATH in your /home/ghost/.bashrc ? [yes|no]
# yes    
```

## Install Tensorflow
```
conda create -n tensorflow python=3.6
source activate tensorflow  
pip install --upgrade pip
pip install --upgrade tensorflow-gpu
```

## Modify Bashrc

The example below helps avoid conflict between miniconda and ROS-
```
read -p "Do you want to source ROS in this workspace (y/n): " input_choice

if [ "$input_choice" = "y" ]
then
  echo "ROS sourced!"
  # Source ROS
  source /opt/ros/kinetic/setup.bash
  # Change ROS editor to nano
  export EDITOR='nano -w'
  # Set up ROS ip
  export ROS_IP=`echo $(hostname -I)` 
  ########################################################################################
  # If you want to source your setup bash in your catkin workspace, uncomment the line below
  # source ~/catkin_ws/devel/setup.bash
  ########################################################################################
 
  break
elif [ "$input_choice" = "n" ]
then
  echo "ROS *NOT* sourced!"
  # Setup conda
  ## Copy the conda path here which was generated automatically while installation 
  break
else
  echo "Warning: Not an acceptable option. Choose (y/n).
          "
fi

done
```

## Additional Resources

### Update a forked repository with git rebased
https://medium.com/@topspinj/how-to-git-rebase-into-a-forked-repo-c9f05e821c8a

https://medium.com/cs-note/ubuntu16-04-install-cuda-9-0-cudnn-7-0-5-80c53404516c

### Installing ros package dependencies
rosdep install --from-paths src --ignore-src -r -y

## Power Management wireless 
iwconfig
cd /etc/NetworkManager/conf.d
gedit default-wifi-powersave-on.conf
change wifi.powersave = 2
check iwconfig

