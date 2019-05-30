@Docker installation ubuntu .
.   Preparation[]   .
    *   Remove old versions
        |   sudo apt-get remove docker docker-engine docker.io containerd runc
    *   Update |apt| repository
        |   sudo apt-get update
    *   Install packages to allow |apt| to use a repository over HTTPS
        |   sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    *   Add Docker’s official GPG key:
        |   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    *   Verify that you now have the key with the fingerprint `9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88`, 
        by searching for the last 8 characters of the fingerprint
        |   sudo apt-key fingerprint 0EBFCD88
        |
        |   pub   rsa4096 2017-02-22 [SCEA]
        |         9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
        |   uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
        |   sub   rsa4096 2017-02-22 [S]
    *   Use the following command to set up the stable repository 
        `X86_64/amd64`.
        |   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu (lsb_release -cs) stable"
    *   For other architectures step |4| at this link [https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository]

.   Installation[]  .
    .   Update |apt| repository
        |   sudo apt-get update
        Install docker
        |   sudo apt-get install docker-ce docker-ce-cli containerd.io
        Verify that Docker CE is installed correctly by running the hello-world image
        |   sudo docker run hello-world

    |More information| [https://docs.docker.com/install/linux/docker-ce/ubuntu]