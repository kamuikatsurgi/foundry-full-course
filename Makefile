-include .env

deploy-SimpleStorage-sepolia:; forge script script/SimpleStorage/DeploySimpleStorage.s.sol --rpc-url $(SEPOLIA_RPC_URL) --broadcast --private-key $(SEPOLIA_PRIVATE_KEY)

deploy-FundMe-sepolia:; forge script script/FundMe/DeployFundMe.s.sol --rpc-url $(SEPOLIA_RPC_URL) --broadcast --private-key $(SEPOLIA_PRIVATE_KEY)

clean:; forge clean