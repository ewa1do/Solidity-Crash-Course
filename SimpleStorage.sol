// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    // Data Types
    // boolean, uint, int, address, bytes

    bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 23; // uint is like the absolute value of a number 
    string favoriteNumberInText = "Twenty Three"; 
    int256 favoriteInt = -23; // int can store positive or negative numbers
    address myAddress = 0xD84EBc4493fCFD445Fa5cC3155d070Bbad5EDbb9;
    bytes32 favoriteBytes = "cat";

    uint256 defaultNumber; // this gets initialized to 0 by default

    ////////////////////////////////////////////////
    // Mappings
    // A mapping is a data structure where a key is "mapped" to a single value

    mapping(string => uint256) public nameToFavoriteNumber;
    mapping(uint => string) public favoriteNumberByName;

    ////////////////////////////////////////////////
    // Arrays and Structs

    People public person = People({
        favoriteNumber: 23,
        name: "Michael Jordan"
    });

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public peopleList;


    ///////////////////////////////////////////////////////
    // Functions

    function setDefaultNumber (uint256 _defaultNumber) public {
        defaultNumber = _defaultNumber;
    } 

    // view and pure functions when called alone, don't spend gas
    function getDefaultNumber () public view returns (uint)  {
        return defaultNumber;
    }
    
    // memory, storage, calldata
    // Calldata and memory means that the varible is gonna be temporal while the transaction is running
    function addPeople (string memory _name, uint _favoriteNumber) public {
        // return peopleList.push(People({ favoriteNumber: _favoriteNumber, name: _name }));
        // People memory newPerson = People({ favoriteNumber: _favoriteNumber, name: _name});
        // People memory newPerson = People(_favoriteNumber, _name);
        // peopleList.push(newPerson);
        peopleList.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
        favoriteNumberByName[_favoriteNumber] = _name;
    }

}