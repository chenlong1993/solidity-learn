// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface  IOtherContract{
    function getBalance() view external  returns (uint256);
    //可以调整状态变量num的值，并且可以往合约砖以太币
    function setNum(uint256 n) external payable ;
     //读取num的变量
    function getNum() external view returns (uint res);
}


contract ICallContract {
    uint256 private num = 0;//定义全局状态变量
    function callSetNum(address addr,uint256 n) external {
       IOtherContract other = IOtherContract(addr);
       other.setNum(n);
    }
    //调用合约
    function callGetNum(IOtherContract addr) external view returns (uint256 n){
        n = addr.getNum();
    }
        //调用合约
    function callGetNum2(IOtherContract addr) external view returns (uint256 n){
        IOtherContract other = IOtherContract(addr);
        n = other.getNum();
    }
}