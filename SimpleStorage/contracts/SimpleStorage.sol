pragma solidity ^ 0.4 .25;

contract SimpleStorage {
    uint storedData;
    address latestEditor;

    function set(uint x) public {
        storedData = x;
        logEditor(msg.sender);
    }

    function get() public constant returns(uint) {
        return storedData;
    }

    function logEditor(address editor) public { 
        latestEditor = editor;
    }

    function getLatestEditor() public constant returns(address) { 
        return latestEditor;
    } 
}