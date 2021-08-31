// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;

import { IPool }        from "../../interfaces/IPool.sol";
import { IPoolFactory } from "../../interfaces/IPoolFactory.sol";

import { PoolAdmin } from "./PoolAdmin.sol";

contract PoolDelegate is PoolAdmin {

    /************************/
    /*** Direct Functions ***/
    /************************/

    function poolFactory_createPool(
        address pool,
        address liquidityAsset,
        address stakeAsset,
        address slFactory,
        address llFactory,
        uint256 stakingFee,
        uint256 delegateFee,
        uint256 liquidityCap
    ) external returns (address) {
        return IPoolFactory(pool).createPool(
            liquidityAsset,
            stakeAsset,
            slFactory,
            llFactory,
            stakingFee,
            delegateFee,
            liquidityCap
        );
    }

    function pool_finalize(address pool) external {
        IPool(pool).finalize();
    }

    function pool_fundLoan(address pool, address loan, address dlFactory, uint256 amount) external {
        IPool(pool).fundLoan(loan, dlFactory, amount);
    }

    function pool_triggerDefault(address pool, address loan, address dlFactory) external {
        IPool(pool).triggerDefault(loan, dlFactory);
    }

    function pool_deactivate(address pool) external {
        IPool(pool).deactivate();
    }

    function pool_setLockupPeriod(address pool, uint256 newLockupPeriod) external {
        return IPool(pool).setLockupPeriod(newLockupPeriod);
    }

    function pool_setStakingFee(address pool, uint256 newStakingFee) external {
        return IPool(pool).setStakingFee(newStakingFee);
    }

    function pool_setAllowList(address pool, address account, bool status) external {
        return IPool(pool).setAllowList(account, status);
    }

    function pool_setPoolAdmin(address pool, address poolAdmin, bool allowed) external {
        return IPool(pool).setPoolAdmin(poolAdmin, allowed);
    }

    function pool_setOpenToPublic(address pool, bool open) external {
        return IPool(pool).setOpenToPublic(open);
    }

    /*********************/
    /*** Try Functions ***/
    /*********************/

    function try_poolFactory_createPool(
        address pool,
        address liquidityAsset,
        address stakeAsset,
        address slFactory,
        address llFactory,
        uint256 stakingFee,
        uint256 delegateFee,
        uint256 liquidityCap
    ) external returns (bool ok) {
        (ok,) = address(pool).call(
            abi.encodeWithSelector(
                IPoolFactory.createPool.selector,
                liquidityAsset,
                stakeAsset,
                slFactory,
                llFactory,
                stakingFee,
                delegateFee,
                liquidityCap
            )
        );
    }

    function try_loan_finalize(address pool) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.finalize.selector));
    }

    function try_loan_fundLoan(address pool, address loan, address dlFactory, uint256 amount) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.fundLoan.selector, loan, dlFactory, amount));
    }

    function try_loan_triggerDefault(address pool, address loan, address dlFactory) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.triggerDefault.selector, loan, dlFactory));
    }

    function try_loan_deactivate(address pool) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.deactivate.selector));
    }

    function try_loan_setLockupPeriod(address pool, uint256 newLockupPeriod) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.setLockupPeriod.selector, newLockupPeriod));
    }

    function try_loan_setStakingFee(address pool, uint256 newStakingFee) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.setStakingFee.selector, newStakingFee));
    }

    function try_loan_setAllowList(address pool, address account, bool status) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.setAllowList.selector, account, status));
    }

    function try_loan_setPoolAdmin(address pool, address poolAdmin, bool allowed) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.setPoolAdmin.selector, poolAdmin, allowed));
    }

    function try_loan_setOpenToPublic(address pool, bool open) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.setOpenToPublic.selector, open));
    }

}
