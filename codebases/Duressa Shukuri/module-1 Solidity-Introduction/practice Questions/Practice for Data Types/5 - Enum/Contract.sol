// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract CustomEnums {
    enum Edibles { Orange, Burger, Toast, Grape }

	Edibles public edibleItem1 = Edibles.Orange ;
	Edibles public edibleItem2 = Edibles.Burger;
	Edibles public edibleItem3 = Edibles.Toast;
	Edibles public edibleItem4 = Edibles.Grape;
}
