// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;
contract AdminRestriction {
    address public administrator;

    constructor() payable {
        administrator = msg.sender;
    }

    receive() external payable {}

    function withdraw() public {
        require(msg.sender == administrator, "Not administrator");

        (bool success, ) = administrator.call{value: address(this).balance}("");
        require(success);
    }
}
