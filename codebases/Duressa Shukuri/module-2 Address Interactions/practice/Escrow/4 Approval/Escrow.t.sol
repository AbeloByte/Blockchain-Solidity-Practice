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

        vm.prank(mediatorReferee);
        custodianContract.authorizeRelease();
    }

    function testBalance() public {
        assertEq(payeeRecipient.balance, 1 ether);
    }
}
