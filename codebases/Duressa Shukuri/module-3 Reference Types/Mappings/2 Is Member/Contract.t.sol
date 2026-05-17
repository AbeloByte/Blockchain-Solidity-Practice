// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/MemberValidator.sol";

contract MemberValidatorTest is Test {
    MemberValidator public myMemberValidator;
    address member1 = address(2);
    address member2 = address(3);
    address nonMember1 = address(4);
    address nonMember2 = address(5);

    function setUp() public {
        myMemberValidator = new MemberValidator();
        myMemberValidator.enrollParticipant(member1);
        myMemberValidator.enrollParticipant(member2);
    }

    function testMembers() public {
        assertEq(myMemberValidator.checkParticipant(member1), true);
        assertEq(myMemberValidator.checkParticipant(member2), true);
    }

    function testNonMembers() public {
        assertEq(myMemberValidator.checkParticipant(nonMember1), false);
        assertEq(myMemberValidator.checkParticipant(nonMember2), false);
    }
}
