var Migrations = artifacts.require("./Migrations.sol");
var Donations = artifacts.require("./Donations.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Donations);
};
