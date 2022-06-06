// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    
    uint256 public minimunUsd = 50 * 1e18;
    
    address[] public founders;
    mapping(address => uint256) public addresToAmountFounded;

    function fund() public payable {
        // Want to be able to set a minimun fund amount in USD
        // 1. How do we send ETH to this contract
        require(getConversionRate(msg.value) > minimunUsd, "Didn't send enough!"); // 1e18 == 1 * 10 ** 18 == 1ether in wei
        founders.push(msg.sender);
        addresToAmountFounded[msg.sender] = msg.value;
        // What is reverting?
        // undo any action before, and sending gas back
    }

    function getPrice () public view returns (uint256) {
        // ABI
        // Address 0xaEA2808407B7319A31A383B6F8B60f04BCa23cE2
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xaEA2808407B7319A31A383B6F8B60f04BCa23cE2);
        (, int price,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        return uint256(price * 1e10); // 1 ** 10 == 10000000000
    }

    function getVersion () public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xaEA2808407B7319A31A383B6F8B60f04BCa23cE2);
        return priceFeed.version();
    }

    function getConversionRate (uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    // function withdraw () { }


}