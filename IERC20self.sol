//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

abstract contract IERC20_Token{

    event Transfer(address indexed _from , address indexed _to,uint indexed _amt);

    event Approval(address  indexed _owner , address indexed _sender,uint indexed _amt);

    function name() public view virtual returns(string memory);
    function symbol() public view virtual returns(string memory);
    function decimal() public view virtual returns(uint);

    function totalSupply() public view virtual returns(uint);

    function balanceOf(address _owner) public view virtual returns(uint);

    function transfer(address to,uint amt) public virtual returns(bool);

    function allowance(address owner,address spender) public view virtual returns(uint);

    function approve(address spender,uint amt) public virtual returns(bool);

    function  tranfer_From(address from,address to,uint amount) public virtual returns(bool);
}

contract Owned{
    address public Owner;
    address public newOwner;

    event OwnershipTransferred(address indexed from, address indexed to);

    constructor(){
        Owner = msg.sender;
    }

    function transferOwnersip(address _to) public{
        require(msg.sender == Owner);
        newOwner = _to;
    }
    function acceptOwnership() public{
        require(msg.sender == newOwner);
        emit OwnershipTransferred(Owner,newOwner);
        Owner = newOwner;
        newOwner = address(0);
    }
}

contract Token is IERC20_Token,Owned{

    string public _name;
    string public _symbol;
    uint public _decimal;
    uint public _totalSupply;
    address public _minter;

    mapping(address=>uint)  balances;
    mapping(address=>mapping(address=>uint)) allowed;

    constructor(){
        _name = "Drip";
        _symbol = "DRP";
        _decimal=0;
        _minter=0xEa1c9a561941a445b119D9555497CA028712732e;
        _totalSupply=100;

        balances[_minter] = _totalSupply;
        emit Transfer(address(0),_minter,_totalSupply);
    }


    function name() public view  override returns(string memory){
        return _name;
    }
    function symbol() public view  override returns(string memory){
        return _symbol;
    }
    function decimal() public view  override returns(uint){
        return _decimal;
    }
    function totalSupply() public view override returns(uint){
        return _totalSupply;
    }

    function balanceOf(address _owner) public view override returns(uint){
        return balances[_owner];
    }

    function  tranfer_From(address _from,address _to,uint amount) public override returns(bool success){
        require(balances[_from] >= amount,"Insufficient Tokens");
        balances[_from] -=amount;
        balances[_to]+=amount;
        emit Transfer(_from,_to,amount);
        return true;
    }

    function transfer(address _to,uint _amount) public override returns(bool success){
        return tranfer_From(msg.sender,_to,_amount);
    }


    function approve(address _spender,uint _amount) public override returns(bool){
        require(_spender != address(0),"Null address not allowed");
        require(balances[msg.sender] >= _amount ,"Insufficient Tokens");
        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function allowance(address _owner,address _spender) public view override returns(uint){
        return allowed[_owner][_spender];
    }

    function mint(uint _amount) public returns(bool){
        require(msg.sender == _minter , "You are not a Minter");
        balances[_minter] += _amount;
        _totalSupply += _amount;
        return true;
    }

    

    

}