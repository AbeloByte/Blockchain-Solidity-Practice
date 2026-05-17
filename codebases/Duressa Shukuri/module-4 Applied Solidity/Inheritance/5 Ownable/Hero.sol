// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

import "./Adversary.sol";

contract Champion {
	uint public health;
	uint public energy = 10;
	constructor(uint _health) {
		health = _health;
	}

	enum AttackTypes { Brawl, Spell }
	function attack(Adversary) public virtual {
		energy--;
	}
}
