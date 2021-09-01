// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;

import { ERC2258User }     from "../../../modules/custodial-ownership-token/contracts/test/accounts/ERC2258User.sol";
import { ExtendedFDTUser } from "../../../modules/funds-distribution-token/contracts/test/accounts/ExtendedFDTUser.sol";

import { IPool } from "../../interfaces/IPool.sol";

contract LiquidityProvider is ERC2258User, ExtendedFDTUser {

    /************************/
    /*** Direct Functions ***/
    /************************/

    function pool_deposit(address pool, uint256 amount) external {
        IPool(pool).deposit(amount);
    }

    function pool_intendToWithdraw(address pool) external {
        IPool(pool).intendToWithdraw();
    }

    function pool_cancelWithdraw(address pool) external {
        IPool(pool).cancelWithdraw();
    }

    function pool_withdraw(address pool, uint256 amount) external {
        IPool(pool).withdraw(amount);
    }

    /*********************/
    /*** Try Functions ***/
    /*********************/

    function try_pool_deposit(address pool, uint256 amount) external returns (bool ok) {
        (ok,) = pool.call(abi.encodeWithSelector(IPool.deposit.selector, amount));
    }

    function try_pool_intendToWithdraw(address pool) external returns (bool ok) {
        (ok,) = pool.call(abi.encodeWithSelector(IPool.intendToWithdraw.selector));
    }

    function try_pool_cancelWithdraw(address pool) external returns (bool ok) {
        (ok,) = pool.call(abi.encodeWithSelector(IPool.cancelWithdraw.selector));
    }

    function try_pool_withdraw(address pool, uint256 amount) external returns (bool ok) {
        (ok,) = pool.call(abi.encodeWithSelector(IPool.withdraw.selector, amount));
    }

}
