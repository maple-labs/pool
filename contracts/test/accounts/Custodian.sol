// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;

import { IPool } from "../../interfaces/IPool.sol";

contract Custodian {

    /************************/
    /*** Direct Functions ***/
    /************************/

    function loan_transferByCustodian(address pool, address from, address to, uint256 amount) external {
        IPool(pool).transferByCustodian(from, to, amount);
    }

    /*********************/
    /*** Try Functions ***/
    /*********************/

    function try_loan_transferByCustodian(address pool, address from, address to, uint256 amount) external returns (bool ok) {
        (ok,) = address(pool).call(abi.encodeWithSelector(IPool.transferByCustodian.selector, from, to, amount));
    }

}
