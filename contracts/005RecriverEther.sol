// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract RecriverEther {
    //定义两个函数，分别在reciive跟fallback中触发
    event ReveiveLog(uint256 amount, uint gas);
    event FallbackLog(uint256 amount, uint gas);

    //receive函数，当合约收到以太币时，msg.data为空时，若该函数存在就会先触发调用
    receive() external payable {
        emit ReveiveLog(msg.value, gasleft());
    }
    //fallback()函数，当合约收到以太币，且msg.data不为空时，会触发该函数
    fallback() external payable {
        emit FallbackLog(msg.value, gasleft());
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}