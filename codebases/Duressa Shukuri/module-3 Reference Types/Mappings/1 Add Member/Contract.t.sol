// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/MemberRegistry.sol";

contract MemberRegistryTest is Test {
    MemberRegistry public myMemberRegistry;
    address member1 = address(2);
    address member2 = address(3);
    address nonMember1 = address(4);
    address nonMember2 = address(5);

    function setUp() public {
        myMemberRegistry = new MemberRegistry();
        myMemberRegistry.enrollParticipant(member1);
        myMemberRegistry.enrollParticipant(member2);
    }

    function testMembers() public {
        assertEq(myMemberRegistry.participants(member1), true);
        assertEq(myMemberRegistry.participants(member2), true);
    }

    function testNonMembers() public {
        assertEq(myMemberRegistry.participants(nonMember1), false);
        assertEq(myMemberRegistry.participants(nonMember2), false);
    }
}
