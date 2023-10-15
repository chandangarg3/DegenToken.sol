// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    constructor() ERC20("Degen", "DGN") {
        _mint(msg.sender, 10000 * 10**18); // Mint 10,000 DGN tokens to the contract deployer
    }

    function mint(address account, uint amount) public onlyOwner {
        _mint(account, amount);
    }

    function transferTokens(address to, uint amount) public {
        require(to != address(0), "Invalid address");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _transfer(msg.sender, to, amount);
    }

    function redeemTokens(uint amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        // Implement redemption logic here, e.g., item purchase
        _burn(msg.sender, amount);
    }

    function burnTokens(uint amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }
}
