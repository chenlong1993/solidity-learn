// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MessageExample{
    address public owner;
    constructor(){

    }
    //payable修饰address类型变量表示能发送接收以太币
    function sendMessage(address payable recipient) public payable {
        //做检查
        require(msg.value>0,"Amount. must greater than 0");
        recipient.transfer(msg.value);
    }
        //返回合约地址的owner地址
    function getOwner() public view returns(address){
        return owner;
    }
    //返回合约地址的以太币余额
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}