// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {IERC20} from "./IERC20.sol";
import {IERC20Metadata} from "./extensions/IERC20Metadata.sol";
import {Context} from "../../utils/Context.sol";
import {IERC20Errors} from "../../interfaces/draft-IERC6093.sol";

contract ERC20 is IERC20, IERC20Metadata, Context, IERC20Errors{
    mapping(address account => uint256) private _balances;

    mapping(address account => mapping(address spender => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;


    constructor (string memory _name, string memory _symbol){
        _name = name_;
        _symbol = symbol_;
    }

    function name() public view virtual returns (string memory){
        return _name;
    }

    function symbol() public view virtual returns (string memory){
        return _symbol;
    }

    function balanceOf(address account) public view virtual returns(uint256){
        return _balances[account];
    }

    function transfer(address to, uint256 amount) public virtual returns(bool){
        address owner = _msgSender;
        require(_balances[owner] >= amount, "Balance is not enough.");
        Transfer(owner, to, amount);
        return true;
        /* if(_balances[owner] < amount){
                print("Balance is not enough")
            }
            else{
                Transfer(owner, to, amount);
                return true;
            }*/    
    }

    function allowance(address owner, uint256 spender) public view virtual returns(uint256){
        return _allowances[owner][spender];
    }

    function approve(address owner, uint256 amount) public view virtual returns(bool){
        uint256 balance = balanceOf(owner);
        require(balance >= amount, "Balance is not enough.");
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public virtual returns(bool){

    }

}

