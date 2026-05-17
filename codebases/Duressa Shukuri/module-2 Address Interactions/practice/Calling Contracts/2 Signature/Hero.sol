// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract Champion {
    bool public alarmTriggered;

    function alarm() external {
        alarmTriggered = true;
    }
}
