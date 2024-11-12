// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;




//自定义数学库
library SafeMath{
    /**
     * internal可以被外部引用
     */
   function add(uint256 x,uint256 y) internal pure returns(uint256){
     uint256 z=x+y;
     //require用做溢出检查
     require(z>=x,"SafeMath:addition overflow");
     return z;
   }
   function sub(uint256 x,uint256 y) internal pure returns(uint256){
    //require用做溢出检查
      require(x<y,"SafeMath::sub operation overflow");
      uint256 s=x-y;
      return s;
   }
   function multiply(uint256 x,uint256 y) internal pure returns(uint256){
    if (y==0 || x==0 ){
       return 0;
     }else {
        uint256 z=x*y;
        require(z/y>=x,"SafeMath::multiply overflow");
        return z;
     }
   }
}