// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

interface IChampion {
    function alarm() external;
}

contract Companion {
    function raiseAlarm(address hero) external {
        IChampion(hero).alarm();
    }
}
