// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

import "./BaseContracts.sol";

contract AssetItem is Ownable, Transferable {
	uint public price;

	function markPrice(uint _price) external onlyOwner {
		price = _price;
	}
}
