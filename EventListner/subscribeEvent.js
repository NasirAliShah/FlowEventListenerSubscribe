const fcl = require("@onflow/fcl")
fcl.config()
    .put("accessNode.api", "http://localhost:8080")

const doStuff = async () => {
    events = await fcl
        .events("A.01cf0e2f2f715450.ExampleNFT.NFTMinted").subscribe(event => {
            console.log(event);
        })
    // .send([
    //     fcl.getEventsAtBlockHeightRange(
    //         "A.1654653399040a61.FlowToken.TokensWithdrawn",
    //         26013459,
    //         26013469
    //     ),
    // ])
    // .then(fcl.decode)
    // console.log(events);
}
doStuff()