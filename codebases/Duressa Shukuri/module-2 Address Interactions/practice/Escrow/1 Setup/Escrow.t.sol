// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Custodian.sol";

contract CustodianTest is Test {
    Custodian public custodianContract;

    function setUp() public {
        custodianContract = new Custodian();
    }

    function testMethods() public {
        assertEq(custodianContract.mediatorReferee(), address(0));
        assertEq(custodianContract.fundingSource(), address(0));
        assertEq(custodianContract.payeeRecipient(), address(0));
    }
}
