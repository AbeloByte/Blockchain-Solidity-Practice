// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract CustodianStorage {
    address public custodian;
    address public charity;

    constructor(address _charity) {
        custodian = msg.sender;
        charity = _charity;
    }

    receive() external payable {}

    function donate() public {
        selfdestruct(payable(charity));
    }
}
