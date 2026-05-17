// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Champion.sol";
import "../src/Companion.sol";

contract ContractTest is Test {
    Companion public sidekick;
    Champion public hero;

    function setUp() public {
        hero = new Champion();
        sidekick = new Companion();
    }

    function testAlert1() public {
        sidekick.raiseAlarm(address(hero), 5, true);
        (bool alarmTriggered, uint adversaries, bool isWeaponized) = hero.surpriseDetails();
        assertEq(alarmTriggered, true, "it should have alarmTriggered the hero");
        assertEq(adversaries, 5, "it should have let the hero know theres 5 adversaries");
        assertEq(isWeaponized, true, "it should have let the hero know the adversaries are isWeaponized");
    }

    function testAlert2() public {
        sidekick.raiseAlarm(address(hero), 2, false);
        (bool alarmTriggered, uint adversaries, bool isWeaponized) = hero.surpriseDetails();
        assertEq(alarmTriggered, true, "it should have alarmTriggered the hero");
        assertEq(adversaries, 2, "it should have let the hero know theres 2 adversaries");
        assertEq(isWeaponized, false, "it should have let the hero know the adversaries are not isWeaponized");
    }
}
