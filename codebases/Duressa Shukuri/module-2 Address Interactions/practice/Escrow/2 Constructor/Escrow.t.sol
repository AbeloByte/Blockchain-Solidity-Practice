// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Custodian.sol";

contract CustodianTest is Test {
    Custodian public custodianContract;
    address mediatorReferee = address(2);
    address fundingSource = address(3);
    address payeeRecipient = address(4);

    function setUp() public {
        vm.prank(fundingSource);
        custodianContract = new Custodian(mediatorReferee, payeeRecipient);
    }

    function testAddresses() public {
        assertEq(custodianContract.mediatorReferee(), mediatorReferee);
        assertEq(custodianContract.fundingSource(), fundingSource);
        assertEq(custodianContract.payeeRecipient(), payeeRecipient);
    }
}
