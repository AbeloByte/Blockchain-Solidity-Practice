// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract RestrictedAccess {
    uint configA;
    uint configB;
    uint configC;
    address administrator;

    constructor() {
        administrator = msg.sender;
    }

    function setA(uint _configA) public adminOnly {
        configA = _configA;
    }

    function setB(uint _configB) public adminOnly {
        configB = _configB;
    }

    function setC(uint _configC) public adminOnly {
        configC = _configC;
    }

    modifier adminOnly {
        require(msg.sender == administrator, "Not administrator");
        _;
    }
}
