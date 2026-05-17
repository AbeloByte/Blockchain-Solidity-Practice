// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;
contract DeployRollback {
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    receive() external payable {}

    function withdraw() public {
        require(msg.sender == owner, "Not owner");

        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success);
    }
}
