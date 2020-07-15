const FA12 = artifacts.require('strict');
const { alice } = require('./../scripts/sandbox/accounts');
const { MichelsonMap } = require('@taquito/taquito');
const saveContractAddress = require('./../helpers/saveContractAddress');

const tokenSupply = 1000000;
const initial_storage = {
    totalSupply: tokenSupply,
    ledger: MichelsonMap.fromLiteral({
        [`${alice.pkh}`]: {
            balance: tokenSupply,
            allowances: MichelsonMap.fromLiteral({})
        }
    })
};

module.exports = async (deployer, network, accounts) => {

    await deployer.deploy(FA12, initial_storage, {overwrite: true});
    await saveContractAddress('fa12-strict', FA12.address);

};
module.exports.initial_storage = initial_storage;
