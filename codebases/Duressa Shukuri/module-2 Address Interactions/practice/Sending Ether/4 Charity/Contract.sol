// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract DonationVault {
    address public administrator;
    address public aidRecipient;

    constructor(address _aidRecipient) {
        administrator = msg.sender;
        aidRecipient = _aidRecipient;
    }

    receive() external payable {}

    function contribute() public {
        selfdestruct(payable(aidRecipient));
    }
}
