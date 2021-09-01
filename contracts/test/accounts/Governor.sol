// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;

import { IPool }        from "../../interfaces/IPool.sol";
import { IPoolFactory } from "../../interfaces/IPoolFactory.sol";

import { PoolFactoryAdmin } from "./PoolFactoryAdmin.sol";

contract Governor is PoolFactoryAdmin {

    /************************/
    /*** Direct Functions ***/
    /************************/

    function poolFactory_setGlobals(address factory, address newGlobals) external {
        IPoolFactory(factory).setGlobals(newGlobals);
    }

    function poolFactory_setPoolFactoryAdmin(address factory, address poolFactoryAdmin, bool allowed) external {
        IPoolFactory(factory).setPoolFactoryAdmin(poolFactoryAdmin, allowed);
    }

    function poolFactory_reclaimERC20(address pool, address token) external {
        IPool(pool).reclaimERC20(token);
    }

    /*********************/
    /*** Try Functions ***/
    /*********************/

    function try_poolFactory_setGlobals(address factory, address newGlobals) external returns (bool ok) {
        (ok,) = factory.call(abi.encodeWithSelector(IPoolFactory.setGlobals.selector, newGlobals));
    }

    function try_poolFactory_setPoolFactoryAdmin(address factory, address poolFactoryAdmin, bool allowed) external returns (bool ok) {
        (ok,) = factory.call(abi.encodeWithSelector(IPoolFactory.setPoolFactoryAdmin.selector, poolFactoryAdmin, allowed));
    }

    function try_pool_reclaimERC20(address pool, address token) external returns (bool ok) {
        (ok,) = pool.call(abi.encodeWithSelector(IPool.reclaimERC20.selector, token));
    }

}
