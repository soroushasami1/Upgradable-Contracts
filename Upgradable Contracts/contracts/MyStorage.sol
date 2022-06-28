// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyStorage {
    uint256 public value;
    address public logicAddress;//the logic contract address
    address owner;

    constructor() {
        owner = msg.sender;
        value = 1;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner of this contract");
        _;
    }

    modifier onlyLogicAddress() {
        require(msg.sender == logicAddress, "This is not the logic address");
        _;
    }

    function changeValue(uint256 _newValue) public onlyLogicAddress {
        value = _newValue;
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    //Update the logic address . upgrade the logic contract 
    //Only owner can change it 
    function updateLogicAddres(address _newLogicAddress) public onlyOwner{
        logicAddress = _newLogicAddress;
    }
    
}
