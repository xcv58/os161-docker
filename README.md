# Install Docker Engine
http://docs.docker.com/engine/installation/

# Pull os161 image and run kernel
```bash
docker pull xcv58/os161
docker run --name os161 -w /root/ -t -i xcv58/os161
cd os161/root/
sys161 kernel
```

You should be able to boot os161
