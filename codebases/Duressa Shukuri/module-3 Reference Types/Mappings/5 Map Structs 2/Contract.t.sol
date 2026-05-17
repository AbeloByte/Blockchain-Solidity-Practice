// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/UserRecordLookupTwo.sol";

contract UserRecordLookupTwoTest is Test {
    UserRecordLookupTwo public myUserRecordLookupTwo;
    address addr1 = address(2);
    address addr2 = address(3);

    function setUp() public {
        myUserRecordLookupTwo = new UserRecordLookupTwo();

        vm.prank(addr1);
        myUserRecordLookupTwo.createUser();

        vm.prank(addr2);
        myUserRecordLookupTwo.createUser();
    }

    function testInitialUsers() public {
        (uint accountBalance, bool isActive) = myUserRecordLookupTwo.profiles(addr1);
        assertEq(accountBalance, 100, "expect initial user accountBalance to be 100");
        assertEq(isActive, true, "expect user to be set to isEnabled initially");
    }

    function testTransfer() public {
        vm.prank(addr2);
        myUserRecordLookupTwo.transfer(addr1, 50);

        (uint accountBalance,) = myUserRecordLookupTwo.profiles(addr1);
        assertEq(accountBalance, 150, "expect a transfer to increase recipients accountBalance");

        (uint balance2,) = myUserRecordLookupTwo.profiles(addr2);
        assertEq(balance2, 50, "expect a transfer to increase recipients accountBalance");
    }

    function testTransferTooMuch() public {
        vm.prank(addr2);
        vm.expectRevert();
        myUserRecordLookupTwo.transfer(addr1, 150);
    }

    function testTransferToInactive() public {
        vm.prank(addr2);
        vm.expectRevert();
        myUserRecordLookupTwo.transfer(address(4), 50);
    }
}
