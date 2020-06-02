# Script

Script was prepared to automate settings of "kubeconfig" per session, so it will be easier to use kubectl command because we do not need to define each time kubconfig files in command line


# Installing

You have to execute install.sh script as root or using sudo

```
$ . install.sh
```
or with sudo
```
$ sudo . install.sh
```

This should:

> add new alias to .bash_profile and install it in current session

Example output:
```
$ . ./install.sh 
This script will create alias for k8set.sh script
Alias was installed previously, so we will remove old alias and then define new one.
Alias will be installed now by adding alias k8set=". /Users/i320159/cloud/modelt/scripts/kubeconfig_set_script/k8set.sh" to .bash_profile.
Alias has been installed.
We will define alias for session.
alias k8set='. /Users/i320159/cloud/modelt/scripts/kubeconfig_set_script/k8set.sh'
Alias for session was defined.
Script has been finished.
```
# Uninstalling

If you want to remove it just execute it with one parameter : remove
```
$ . install.sh remove
```
or with sudo
```
$ sudo . install.sh remove
```


# Running

> run script by typing k8set in terminal

```
$ k8set
There are 15 kubeconfig files in current folder
Type 0 for - k8s-mstr-csemea-csemeaprod-d10-kub.kubeconfig
Type 1 for - k8s-mstr-csemea-csemeaprod-d12-kub.kubeconfig
Type 2 for - k8s-mstr-csemea-csemeaprod-d13-kub.kubeconfig
Type 3 for - k8s-mstr-csemea-csemeaprod-d2-kub.kubeconfig
Type 4 for - k8s-mstr-csemea-csemeaprod-d3-kub.kubeconfig
Type 5 for - k8s-mstr-csemea-csemeaprod-d4-kub-2.kubeconfig
Type 6 for - k8s-mstr-csemea-csemeaprod-d4-kub.kubeconfig
Type 7 for - k8s-mstr-csemea-csemeaprod-dev1-kub.kubeconfig
Type 8 for - k8s-mstr-csemea-csemeaprod-p4-5-kub.kubeconfig
Type 9 for - k8s-mstr-csemea-csemeaprod-p4-kub.kubeconfig
Type 10 for - k8s-mstr-csemea-csemeaprod-p5-kub2.kubeconfig
Type 11 for - k8s-mstr-csemea-csemeaprod-p6-5-kub.kubeconfig
Type 12 for - k8s-mstr-csemea-csemeaprod-p6-kub.kubeconfig
Type 13 for - k8s-mstr-csemea-csemeaprod-s1-kub.kubeconfig
Type 14 for - k8s-mstr-csemea-csemeaprod-z1-kub.kubeconfig
Please type here file number :4
Following kubeconfig: k8s-mstr-csemea-csemeaprod-d3-kub.kubeconfig will be set as active one.
Script has been finished.
```

If you want just use kubeconfigs from different folder, you can call script with one parameter and put there the folder 

```
k8set /some_folder_with_kubeconfigs/
```
