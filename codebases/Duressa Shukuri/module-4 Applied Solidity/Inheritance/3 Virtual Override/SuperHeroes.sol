// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

import "./Champion.sol";


contract Wizard is Champion {
    constructor() Champion(50) {}

    function attack(Adversary adversary) public override {
        adversary.takeAttack(AttackTypes.Spell);
    }
}

contract Fighter is Champion {
    constructor() Champion(200) {}

    function attack(Adversary adversary) public override {
        adversary.takeAttack(AttackTypes.Brawl);
    }
}
