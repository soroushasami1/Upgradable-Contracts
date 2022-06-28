// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IMyStorage {
    function changeValue(uint256 _newValue) external;
    function getValue() external view returns (uint256);
    function msgSender() external view returns (address);
}

contract MyLogicV1 {
    address MyStorage;

    constructor(address _MyStorage) {
        MyStorage = _MyStorage;
    }

    function changeValue(uint256 _value) public {
        IMyStorage CMyStorage = IMyStorage(MyStorage);
        uint256 newValue = _value + 10;//v1 logic is + 10
        CMyStorage.changeValue(newValue);
    }

    function getValue() public view returns(uint256) {
        IMyStorage CMyStorage = IMyStorage(MyStorage);
        return CMyStorage.getValue();
    }

}
