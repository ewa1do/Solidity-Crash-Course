// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";
    
    // inheritance 
contract ExtraStorage is SimpleStorage {
    // override
    // keywords: virtual, override

    function setDefaultNumber (uint256 _defaultNumber) public override {
        defaultNumber = _defaultNumber + 5;
    }
}