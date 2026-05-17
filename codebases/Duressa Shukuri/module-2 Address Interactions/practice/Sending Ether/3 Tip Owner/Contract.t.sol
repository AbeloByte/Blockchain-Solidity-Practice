// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/AdminGratuity.sol";

contract AdminGratuityTest is Test {
    AdminGratuity public myAdminGratuity;
    address msgSender = address(3);

    function setUp() public {
        vm.prank(msgSender);
        myAdminGratuity = new AdminGratuity();
    }

    function testSendEther() public {
        address contractAddr = address(myAdminGratuity);
        contractAddr.call{ value: 2 ether }("");
        assertEq(contractAddr.balance, 2 ether);
    }

    function verifyGratuitySent() public {
        myAdminGratuity.gratuity{ value: 1 ether }();
        assertEq(msgSender.balance, 1 ether);
    }
}
