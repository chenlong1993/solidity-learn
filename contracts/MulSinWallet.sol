// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MulSinWallet{
    //定义存款事件
    event Deposit(address indexed sender,uint amount);
    //定义提交交易申请事件
    event Submit(uint indexed txid);
    //定义授权批准事件
    event Approve(address indexed  owner,uint indexed txid);
    //定义撤销批准事件
    event Revoke(address indexed owner,uint indexed txid);
    //定义执行事件，记录执行的交易序号
    event Execute(uint indexed txid);

    address[] public owners;
 
    mapping (address=>bool) public isOwner;

    uint public required;

    struct Transaction{
        address to;//发送地址
        uint value;
        bytes data;
        bool executed;
    }

    Transaction[] public  transactions;
    mapping (uint=>mapping(address=>bool)) public approved;

    constructor(address[] memory _owners,uint _required){
        require(_owners.length>0,"owners size must greater than zero;");
        require(_required>0 && _required<_owners.length,"invalid require number of owners");
        //将私钥持有人依次存到合约当中
        for(uint256 i=0;i<_owners.length;++i){
            address _owner = _owners[i];
            require(_owner != _owners[0], "invald owber");
            require(!isOwner[_owner],"owner had");
            isOwner[_owner] = true;
            owners.push(_owner);
        }
         required = _required;
    }
    
    receive() external payable { 
        //触发事件
        emit Deposit(msg.sender, msg.value);
    }
    //函数修改器，用于判断函数调用者是否在私钥持有人数组
    modifier onlyOwner(){
        require(isOwner[msg.sender],"invalid is owner");
        _;
    }

    function submit(address _to,uint _value,bytes calldata _data)external onlyOwner{
        //构造交易函数，并添加到数组
        transactions.push(Transaction({to:_to,value:_value,data:_data,executed:false}));
        emit Submit(transactions.length, - 1);
    }

    modifier isTxid(uint _txid){
        require(_txid<transactions.length,"invalid txid");
        _;
    }

    modifier notApproved(uint _txid){
        require(!approved[_txid][msg.sender],"had approved");
        _;
    }
    modifier notExecuted(uint _txid){
        require(!transactions[_txid].executed,"had executed");
        _;
    }
}