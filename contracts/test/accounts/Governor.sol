// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;

import { IPoolFactory } from "../../interfaces/IPoolFactory.sol";

import { PoolFactoryAdmin } from "./PoolFactoryAdmin.sol";

contract Governor is PoolFactoryAdmin {

    /************************/
    /*** Direct Functions ***/
    /************************/

    function poolFactory_setGlobals(address pool, address newGlobals) external {
        IPoolFactory(pool).setGlobals(newGlobals);
    }

    function poolFactory_setPoolFactoryAdmin(address pool, address poolFactoryAdmin, bool allowed) external {
        IPoolFactory(pool).setPoolFactoryAdmin(poolFactoryAdmin, allowed);
    }

    function poolFactory_reclaimERC20(address pool, address token) external {
        IPoolFactory(pool).reclaimERC20(token);
    }

    /*********************/
    /*** Try Functions ***/
    /*********************/

    function try_poolFactory_setGlobals(address pool, address newGlobals) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPoolFactory.setGlobals.selector, newGlobals));
    }

    function try_poolFactory_setPoolFactoryAdmin(address pool, address poolFactoryAdmin, bool allowed) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPoolFactory.setPoolFactoryAdmin.selector, poolFactoryAdmin, allowed));
    }

    function try_poolFactory_reclaimERC20(address pool, address token) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPoolFactory.reclaimERC20.selector, token));
    }

}
