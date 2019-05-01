Ubuntu inotify watches .
 .  Get the |current limit| of inotify watches. Default limit is |8196| watches.
    |{lng:bash}
    |   cat /proc/sys/fs/inotify/max_user_watches

    |Temporary| set a new limit of watches
    |{lng:bash}
    | sudo sysctl fs.inotify.max_user_watches=524288
    | sudo sysctl -p

    |Permanently| set a new limit of watches
    |{lng:bash}
    | echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
    | sudo sysctl -p

    You may also need to pay attention to the 
    values of |{lng:bash}max_queued_events| and |{lng:bash}max_user_instances|

   
   More info[https://linux.die.net/man/7/inotify]