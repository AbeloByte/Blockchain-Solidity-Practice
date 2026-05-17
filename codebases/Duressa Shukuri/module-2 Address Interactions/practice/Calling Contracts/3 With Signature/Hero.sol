// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract Champion {
    SurpriseAttack public surpriseDetails;

    struct SurpriseAttack {
        bool alarmTriggered;
        uint adversaries;
        bool isWeaponized;
    }

    function alarm(uint adversaries, bool isWeaponized) external {
        surpriseDetails = SurpriseAttack(true, adversaries, isWeaponized);
    }
}
