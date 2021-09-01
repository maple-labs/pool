// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;

import { IPool } from "../../interfaces/IPool.sol";

contract PoolAdmin {

    /************************/
    /*** Direct Functions ***/
    /************************/

    function pool_claim(address pool, address loan, address dlFactory) external returns (uint256[7] memory) {
        return IPool(pool).claim(loan, dlFactory);
    }

    function pool_setLiquidityCap(address pool, uint256 newLiquidityCap) external {
        return IPool(pool).setLiquidityCap(newLiquidityCap);
    }

    /*********************/
    /*** Try Functions ***/
    /*********************/

    function try_pool_claim(address pool, address loan, address dlFactory) external returns (bool ok) {
        (ok,) = pool.call(abi.encodeWithSelector(IPool.claim.selector, loan, dlFactory));
    }

    function try_pool_setLiquidityCap(address pool, uint256 newLiquidityCap) external returns (bool ok) {
        (ok,) = pool.call(abi.encodeWithSelector(IPool.setLiquidityCap.selector, newLiquidityCap));
    }

}
