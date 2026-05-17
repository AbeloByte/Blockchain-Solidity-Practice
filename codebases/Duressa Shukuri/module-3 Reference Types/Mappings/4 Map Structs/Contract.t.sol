// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/UserRecordLookup.sol";

contract UserRecordLookupTest is Test {
    UserRecordLookup public myUserRecordLookup;
    address addr1 = address(2);

    function setUp() public {
        myUserRecordLookup = new UserRecordLookup();
    }

    function testCreateUser() public {
        vm.startPrank(addr1);

        myUserRecordLookup.createUser();
        (uint accountBalance, bool isActive) = myUserRecordLookup.profiles(addr1);
        assertEq(accountBalance, 100, "expect initial user accountBalance to be 100");
        assertEq(isActive, true, "expect user to be set to isEnabled initially");

        vm.expectRevert();
        myUserRecordLookup.createUser();
    }
}
