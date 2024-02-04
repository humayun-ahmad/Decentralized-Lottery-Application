//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Lottery{
    address public manager;
    address payable[] public participants;

    constructor()
    {
        manager=msg.sender; // global variable
    }

    receive() external payable 
    {
        require(msg.value == 1 ether);
        participants.push(payable (msg.sender));
    }

    function getBalance() public view returns(uint)
    {
        require(msg.sender == manager);
        return address(this).balance;
    }
}