// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract StorageFactory {
    // SimpleStorage public simpleStorage;
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        // SimpleStorage simpleStorage = new SimpleStorage();
        // simpleStorageArray.push(simpleStorage);
        simpleStorageArray.push(new SimpleStorage());
    }

    function sfStore (uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address
        // ABI - Application Binaty Inteface
        // SimpleStorage simpleStorageVar = simpleStorageArray[_simpleStorageIndex];
        // simpleStorageVar.setDefaultNumber(_simpleStorageNumber);
        simpleStorageArray[_simpleStorageIndex].setDefaultNumber(_simpleStorageNumber);
    }

    function sfGet (uint256 _simpleStorageIndex) public view returns(uint256)  {
        // SimpleStorage simpleStorageVar = simpleStorageArray[_simpleStorageIndex];
        // return simpleStorageVar.getDefaultNumber();
        return simpleStorageArray[_simpleStorageIndex].getDefaultNumber();
    }
}