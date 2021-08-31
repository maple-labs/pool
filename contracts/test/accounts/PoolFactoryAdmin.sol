// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;

import { IPoolFactory } from "../../interfaces/IPoolFactory.sol";

contract PoolFactoryAdmin {

    /************************/
    /*** Direct Functions ***/
    /************************/

    function poolFactory_pause(address pool) external {
        IPoolFactory(pool).pause();
    }

    function poolFactory_unpause(address pool) external {
        IPoolFactory(pool).unpause();
    }

    /*********************/
    /*** Try Functions ***/
    /*********************/

    function try_poolFactory_pause(address pool) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPoolFactory.pause.selector));
    }

    function try_poolFactory_unpause(address pool, address poolFactoryAdmin, bool allowed) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPoolFactory.unpause.selector));
    }

}
