// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;

import { ExtendedFDTUser } from "../../../modules/funds-distribution-token/contracts/test/accounts/ExtendedFDTUser.sol";

import { IPool } from "../../interfaces/IPool.sol";

contract LiquidityProvider is ExtendedFDTUser {

    /************************/
    /*** Direct Functions ***/
    /************************/

    function loan_deposit(address pool, uint256 amount) external {
        IPool(pool).deposit(amount);
    }

    function loan_intendToWithdraw(address pool) external {
        IPool(pool).intendToWithdraw();
    }

    function loan_cancelWithdraw(address pool) external {
        IPool(pool).cancelWithdraw();
    }

    function loan_withdraw(address pool, uint256 amount) external {
        IPool(pool).withdraw(amount);
    }

    function loan_increaseCustodyAllowance(address pool, address custodian, uint256 amount) external {
        IPool(pool).increaseCustodyAllowance(custodian, amount);
    }

    /*********************/
    /*** Try Functions ***/
    /*********************/

    function try_loan_deposit(address pool, uint256 amount) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.deposit.selector, amount));
    }

    function try_loan_intendToWithdraw(address pool) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.intendToWithdraw.selector));
    }

    function try_loan_cancelWithdraw(address pool) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.cancelWithdraw.selector));
    }

    function try_loan_withdraw(address pool, uint256 amount) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.withdraw.selector, amount));
    }

    function try_loan_increaseCustodyAllowance(address pool, address custodian, uint256 amount) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.increaseCustodyAllowance.selector, custodian, amount));
    }

}
