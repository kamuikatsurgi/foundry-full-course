**A list of all the commands used by Patrick during the foundry course:**

- anvil -> to run a local chain

- forge create <contractName> --interactive
- forge create <contractName> --rpc-url $RPC_URL --private-key $PRIVATE_KEY

- forge script script/SimpleStorage/DeploySimpleStorage.s.sol
- forge script script/SimpleStorage/DeploySimpleStorage.s.sol --rpc-url $SEPOLIA_RPC_URL --broadcast --private-key $SEPOLIA_PRIVATE_KEY

- cast --to-base <hex-value> dec
- source .env
- echo $variable_name

- cast send 0x2BC48EC588d7b65e2a055821Aa07B3E4F2249898 (Deployed Contract address) "store(uint256)" (function signature) 6969 (arguments) --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY

- cast call 0x2BC48EC588d7b65e2a055821Aa07B3E4F2249898 (Deployed Contract address) "retrieve()" (function signature) --rpc-url $SEPOLIA_RPC_URL
