// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Custodian.sol";

contract CustodianTest is Test {
    Custodian public custodianContract;
    address mediatorReferee = address(2);
    address fundingSource = address(3);
    address payable payeeRecipient = payable(address(4));

    function setUp() public {
        hoax(fundingSource);
        custodianContract = new Custodian{ value: 1 ether }(mediatorReferee, payeeRecipient);
    }

    function testAsOther() public {
        vm.prank(fundingSource);
        vm.expectRevert();
        custodianContract.authorizeRelease();

        vm.prank(payeeRecipient);
        vm.expectRevert();
        custodianContract.authorizeRelease();
    }

    function testAsArbiter() public {
        vm.prank(mediatorReferee);
        custodianContract.authorizeRelease();

        assertEq(payeeRecipient.balance, 1 ether);
    }
}
