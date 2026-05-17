// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract Custodian {
       address public fundingSource;
    address public payeeRecipient;
    address public mediatorReferee;

    event ConsentGiven(uint amount);

    constructor(address _mediatorReferee, address _payeeRecipient) payable {
        fundingSource = msg.sender;
        mediatorReferee = _mediatorReferee;
        payeeRecipient = _payeeRecipient;
    }

    function authorizeRelease() external {
        require(msg.sender == mediatorReferee, "Not mediatorReferee");

        uint amount = address(this).balance;

        emit ConsentGiven(amount);

        (bool success, ) = payeeRecipient.call{value: amount}("");
        require(success);
    }
}
