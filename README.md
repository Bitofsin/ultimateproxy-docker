# ultimateproxy-docker has been updated to UltimateProxyV2.2.0.0
This is the first container i have built. 

The UltimateProxyV2 is launched with the "config/config.json" in the container this is the main config.json


This is my repo for the container https://hub.docker.com/r/bitofsin/ultimateproxy


The folowing repo has all the most up to date information on the proxy https://github.com/romslf/Ultimate-Proxy

# config examples for docker image

## Ratio and Failover Switching
<details>
<summary>This is the same as UltimateProxyV2 Repo click to show</summary>

```javascript
{
  "allowedAddresses": [
    "0.0.0.0"	// This allow every IP to connect to proxy, please remove it before adding only needed IPs
  ],
    "poolList": [
    {
      "address": "ethw.herominers.com",
      "port": 1147,
      "ssl": true,	// SSL Pool
      "ratio": 98	// Will mine for 98% of RatioWindowTimeHours before switching
    },
    {
      "address": "na.ethw.herominers.com",
      "port": 1147,
      "ratio": 1,	// Will mine for 1% of RatioWindowTimeHours before switching
      "wallet": "solo:ANOTHER WALLET",	// Will use this wallet instead of global Wallet (Note: "solo:" is used to solo mine on herominers)
      "password": "ANOTHER PASS"	// Will use this password instead of global Password
    },
    {
      "address": "192.168.1.30",
      "port": 8545,
      "node": true,	// Solo mining to node
      "ratio": 1	// Will mine for 1% of RatioWindowTimeHours before switching
    },
    {
      "address": "ethw.2miners.com",	// Will be only used as failover since no ratio is set
      "port": 2020
    }
  ],
  "Protocol": "Stratum", // The mining protocol used (Ethproxy/Stratum/Nicehash)
  "Coin": "ETHW",	// The coin you want to mine
  "Wallet": "YOUR WALLET HERE",	// Your mining wallet
  "Worker": "UltimateProxy",	// Proxy worker name
  "Password": "x",	// Proxy password
  "RatioWindowTimeHours": 1,  // Used for ratio switch strategie, minimum 1H maximum 24H
  "ProxyPort": 4444,	// Proxy port
  "ProxyCert": "",	// Set it if you want your workers to connect to proxy using SSL (See "Docs" folder create a .pfx file)
  "PrintStats": true,	// Display workers/pools stats
  "StatsIntervalSeconds": 60,	// Delay between PrintStats
  "NodeGetWorkIntervalMs": 500,	// Delay between node solo getWork requests
  "PrintJobs": true,	// Print new jobs or not
  "AllowDuplicateWorkerNames": false, // If you use duplicate worker names (workers will be deleted from stats table on disconnection)
  "ForceWorkersReconnect": false // Reconnect workers on switch, NEED to be turned on if you use Stratum/Nicehash protocol and that your miner doesn't support set.extranonce request
}
```

</details>

## SmartSwitching Example Etchash and NH Etchash

"config.json" file name is requird. 

Make sure to not change the file name just the contents. if the file name gets changed the proxy wont be able to find it.

For smart switching to work in the docker container the coin Filename paths must be like below

<details>
<summary>Click to show example required for Docker image</summary>

```javascript
{
  "Coins": [
    "ETC",
    "NH Etchash"
  ],
  "Mode": "PROFIT",
  "MinimumTimeSeconds": 900,
  "MinimumDifferencePercent": 1,
  "ConfigList": [
    {
      "Coin": "ETC",
      "FileName": "config/config-ETC.json"
    },
    {
      "Coin": "NH Ethash",
      "FileName": "config/config-NH-Etchash.json"
    }
  ]
}
...

</details>
 