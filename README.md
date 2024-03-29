# How to run 

## Environment
These contracts are written in Solidity, and have been compiled and tested using Truffle and Ganache, 
both part of the Truffle Suite https://github.com/trufflesuite.

Ganache is used to easily set up a testing network. Ganache both comes as a CLI, or with a GUI. The truffle-config file should have it's network properties adjusted according to the Ganache network setup. They are currently set to the defaults of Ganache.



## Commands

To compile contracts:

```bash 
trufle compile
```

To deploy them onto the network:
```bash
trufle migrate
```

To start up the Truffle console to interact with the deployed contracts:
```bash 
truffle console --network development
```


## Disclaimer
These were developed as part of a simple university project. Using these on an actual Ethereum network, transfering real ETH or data, is completely your own responsibility. 
If something doesn't work as expected, and you lose actual data or Etheruem of value, I can not be held accountable.


