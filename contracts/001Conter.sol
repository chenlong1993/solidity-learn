// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
//引入自定义的lib
import "../library/SafeMath.sol";

contract Conter {
    //调用库函数进行计算
    using SafeMath for uint256;
    uint cnt = 18;

    function get() public view returns (uint){
        return cnt;
    }
    // function set(uint cnt2) public view returns(uint){
    //      return cnt2;
    // }
    function incr() public returns (uint)  {
        cnt += 1;
        return cnt;
    }

    function deincr() public returns (uint)  {
        cnt -= 1;
        return cnt;
    }
    //调用lib计算
    function getLibSub() public pure returns (uint256){
        uint256 sub_res = SafeMath.sub(1000, 100);  //减法运算
        return sub_res;
    }

    function getLibAdd() public pure returns (uint256){
        uint256 res = SafeMath.add(30, 40);//加法运算
        return res;
    }

    function getLibMult() public pure returns (uint256){
        uint256 mul_res = SafeMath.multiply(10, 8);   //乘法运算
        return mul_res;
    }


}