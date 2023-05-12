// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomToken is ERC20, Ownable {
    // Creating a custom token with initial supply of 100
    constructor() ERC20("CustomToken", "CTO") {
        _mint(msg.sender, 10000);
    }
    // Mint function allows us to add aditional currency 
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}