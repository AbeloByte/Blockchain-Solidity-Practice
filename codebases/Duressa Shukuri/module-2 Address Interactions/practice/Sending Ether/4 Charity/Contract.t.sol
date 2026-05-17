// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/DonationVault.sol";

contract DonationVaultTest is Test {
    DonationVault public myDonationVault;
    address msgSender = address(3);
    address aidRecipient = address(4);

    function setUp() public {
        vm.prank(msgSender);
        myDonationVault = new DonationVault(aidRecipient);
        address(myDonationVault).call{ value: 4 ether }("");
    }

    function testSend() public {
        assertEq(address(myDonationVault).balance, 4 ether);
    }

    function verifyContribution() public {
        myDonationVault.contribute();
        assertEq(aidRecipient.balance, 4 ether);
    }
}
