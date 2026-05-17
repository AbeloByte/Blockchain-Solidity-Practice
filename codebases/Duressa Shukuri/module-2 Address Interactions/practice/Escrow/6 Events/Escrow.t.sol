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

    function testApprovalEvent() public {
        vm.prank(mediatorReferee);
        vm.recordLogs();

        custodianContract.authorizeRelease();

        Vm.Log[] memory entries = vm.getRecordedLogs();
        assertEq(entries.length, 1);
        assertEq(entries[0].topics[0], keccak256("ConsentGiven(uint256)"));
        assertEq(abi.decode(entries[0].data, (uint)), 1 ether);
    }
}
