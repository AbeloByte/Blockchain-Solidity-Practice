// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;


contract Companion {
    function raiseAlarm(address hero, uint adversaries, bool isWeaponized) external {
        (bool success, ) = hero.call(
            abi.encodeWithSignature("alarm(uint256,bool)", adversaries, isWeaponized)
        );

        require(success);
    }
}
