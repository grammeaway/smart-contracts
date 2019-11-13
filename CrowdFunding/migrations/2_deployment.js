var CrowdFunding = artifacts.require("CrowdFunding");

module.exports = function(deployer) {
 const _duration = 600;
 const _goalAmount = 25;
 deployer.deploy(CrowdFunding, _duration, _goalAmount);
};
