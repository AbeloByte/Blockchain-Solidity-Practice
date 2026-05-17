// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

import "./Champion.sol";

contract Adversary {
    uint public health = 100;

	function takeAttack(Champion.AttackTypes attackType) external {
        if(attackType == Champion.AttackTypes.Brawl) {
            health -= 50;
        }
        else if(attackType == Champion.AttackTypes.Spell) {
            health -= 80;
        }
	}
}
