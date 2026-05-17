// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Champion.sol";
import "../src/SuperHeroes.sol";
import "../src/Adversary.sol";

contract EscrowTest is Test {
    Fighter public fighter;
    Wizard public wizard;
    Adversary public adversary;

    function setUp() public {
        fighter = new Fighter();
        wizard = new Wizard();
        adversary = new Adversary();
    }

    function testWarriorAttack() public {
        fighter.attack(adversary);
        assertEq(adversary.health(), 50);
        assertEq(fighter.energy(), 9);
    }

    function testMageAttack() public {
        wizard.attack(adversary);
        assertEq(adversary.health(), 20);
        assertEq(wizard.energy(), 9);
    }
}
