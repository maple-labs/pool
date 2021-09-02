// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;

import { IPoolFactory } from "../../interfaces/IPoolFactory.sol";

contract PoolFactoryAdmin {

    /************************/
    /*** Direct Functions ***/
    /************************/

    function poolFactory_pause(address factory) external {
        IPoolFactory(factory).pause();
    }

    function poolFactory_unpause(address factory) external {
        IPoolFactory(factory).unpause();
    }

    /*********************/
    /*** Try Functions ***/
    /*********************/

    function try_poolFactory_pause(address factory) external returns (bool ok) {
        (ok,) = factory.call(abi.encodeWithSelector(IPoolFactory.pause.selector));
    }

    function try_poolFactory_unpause(address factory) external returns (bool ok) {
        (ok,) = factory.call(abi.encodeWithSelector(IPoolFactory.unpause.selector));
    }

}
