const MyStorage = artifacts.require("MyStorage");
const MyLogicV1 = artifacts.require("MyLogicV1");

module.exports = function (deployer, network, accounts) {
  deployer.then(async () => {
    await deployer.deploy(MyStorage);
    await deployer.deploy(MyLogicV1 , MyStorage.address);
  })
}