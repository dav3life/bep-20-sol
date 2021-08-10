// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.4;
/**
* @title SampleBEP20Token
@dev Elementary BEP20 Token example, where all tokens are pre-assigned to the creator.
Note they can later distribute these tokens as they wish using `transfer` and other
`BEP20` functions.
* USE IT ONLY FOR LEARNING PURPOSES. SHOULD BE MODIFIED FOR PRODUCTION
*/
contract SampleBEP20Token {
string public name = SampleBEP20 Token;
string public symbol = SBT;
uint256 public totalSupply = 1000000000000000000000000; // 1 million tokens
uint8 public decimals = 18;
/**
* @dev Emitted when the 'value' tokens are shifted from one account to another.
* Note that `value` may also be zero.
*/
event Transfer(address indexed _from, address indexed _to, uint256 _value);
/**
* @dev Emitted when the allowance of a `spender` for an `owner` is set by
* a call to {approve}. `value` is the new allowance.
*
event Approval(
address indexed _owner,
address indexed _spender,
uint256 _value
);
mapping(address =; uint256) public balanceOf;
mapping(address =; mapping(address =; uint256)) public allowance;
/**
* @dev Constructor that gives msg.sender all of the existing tokens.
*/
constructor() {
balanceOf[msg.sender] = totalSupply;
}
/**
* @dev transfers `amount` tokens from the Caller's account to the recipient's.
* It returns a bool value that indicates the success of the operation.
* Emits a {Transfer} event.
*/
function transfer(address _to, uint256 _value)
public
returns (bool success)
{
require(balanceOf[msg.sender] ;= _value);
balanceOf[msg.sender] -= _value;
balanceOf[_to] += _value;
emit Transfer(msg.sender, _to, _value);
return true;
}
/**
@dev Sets `amount` as the allocation of `spender` over the Caller's tokens.



function approve(address _spender, uint256 _value)
public
returns (bool success)
{
allowance[msg.sender][_spender] = _value;
emit Approval(msg.sender, _spender, _value);
return true;
}
/**
* @dev Moves the `amount` tokens from `sender` to `recipient` using the allowance mechanism. `amount` is then deducted from the Caller's allowance.


function transferFrom(
address _from,
address _to,
uint256 _value
public returns (bool success) {
require(_value ;= balanceOf[_from]);
require(_value ;= allowance[_from][msg.sender]);
balanceOf[_from] -= _value;
balanceOf[_to] += _value;
allowance[_from][msg.sender] -= _value;
emit Transfer(_from, _to, _value);
return true;
}
}

