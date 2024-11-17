// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
//定义接口
interface  IOtherContract{
    function getBalance() view external  returns (uint256);
    //可以调整状态变量num的值，并且可以往合约砖以太币
    function setNum(uint256 n) external payable ;
     //读取num的变量
    function getNum() external view returns (uint res);
}

