// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract OtherContract {
    uint256 private num = 0;//定义全局状态变量

    event  ReceiveEther(uint amount, uint gas);//自定义事件，当接收到以太币时候，自动记录下amount跟gas

    function getBalance() view public returns (uint256) { //返回num变量的
       return address(this).balance;
    }
    //可以调整状态变量num的值，并且可以往合约砖以太币
    function setNum(uint256 n) external payable {
        num = n;
        if(msg.value>0){
            emit ReceiveEther(msg.value,gasleft());
        }
    }

     //读取num的变量
    function getNum() external view returns (uint res) { //返回num变量的值
         res = num;
    }

}