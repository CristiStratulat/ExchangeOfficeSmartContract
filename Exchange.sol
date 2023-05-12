// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ExchangeOffice {
    ERC20 public CTO;

    constructor(address customToken)
    {
        CTO = ERC20(customToken);
    }

    // We assume the currency exchange rate is always 1 for selling (simplicity reasons)
    function sellCTOToken (uint amount) public payable{
        require(CTO.balanceOf(msg.sender) >= amount,"Not enough CTO Tokens to sell");
        require(address(this).balance >= amount, "Not enough wei to complete the transaction");
        CTO.transferFrom(msg.sender,address(this), amount);
        payable (msg.sender).transfer(amount);
    }

    // We assume the currency exchange rate is always 1 for buying (simplicity reasons)
    function buyCTOTokens(uint amount) public payable {
        require(msg.value >= amount, "Not enough wei for buying CTO Tokens");
        uint available_CTO = CTO.balanceOf(address(this));
        require(available_CTO >= amount, "Not enough CTO Tokens to complete the trade");
        CTO.transfer(msg.sender, amount);
    }
}