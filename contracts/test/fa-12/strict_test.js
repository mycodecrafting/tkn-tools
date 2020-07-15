const FA12 = artifacts.require('strict');
const { alice, bob } = require('./../../scripts/sandbox/accounts');
const { initial_storage } = require('./../../migrations/1_deploy_fa12_strict.js');

contract('fa-12-strict', accounts => {
    let storage;
    let fa12_strict_instance;

    before(async () => {
        fa12_strict_instance = await FA12.deployed();
        // Display the current contract address for debugging purposes
        console.log('  Contract deployed at:', fa12_strict_instance.address);
        storage = await fa12_strict_instance.storage();
    });

    const initialBalanceAlice = initial_storage.ledger.get(alice.pkh).balance;
    it(`should store a balance of ${initialBalanceAlice} for Alice`, async () => {
        const aliceLedger = await storage.ledger.get(alice.pkh);
        assert.equal(initialBalanceAlice, aliceLedger.balance);
    });

    it(`should not store any balance for Bob`, async () => {
        const bobLedger = await storage.ledger.get(bob.pkh);
        assert.equal(bobLedger, undefined);
    });

    it(`should transfer 1 token from Alice to Bob`, async () => {
        await fa12_strict_instance.transfer(alice.pkh, bob.pkh, 1);

        const bobLedger = await storage.ledger.get(bob.pkh);
        assert.equal(bobLedger.balance, 1);

        const aliceLedger = await storage.ledger.get(alice.pkh);
        assert.equal(aliceLedger.balance, initialBalanceAlice - 1);
    });

    it(`should not transfer tokens from Alice to Bob when Alice's balance is insufficient`, async () => {
        try {
            await fa12_strict_instance.transfer(alice.pkh, bob.pkh, initialBalanceAlice + 1);
        } catch (e) {
            assert.equal(e.message, "NotEnoughBalance");
        }
    });

});

    //
    // it(`should not allow transfers from_ an address that did not sign the transaction`, async () => {
    //     const transferParam = [
    //         {
    //             token_id: 0,
    //             amount: 1,
    //             from_: bob.pkh,
    //             to_: alice.pkh
    //         }
    //     ];
    //
    //     try {
    //         /**
    //          * Transactions in the test suite are signed by a secret/private key
    //          * configured in truffle-config.js
    //          */
    //         await tzip_12_tutorial_instance.transfer(transferParam);
    //     } catch (e) {
    //         assert.equal(e.message, constants.contractErrors.fromEqualToSenderAddress)
    //     }
    // });
