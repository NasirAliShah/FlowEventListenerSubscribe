const fcl = require("@onflow/fcl")
fcl.config()
    .put("accessNode.api", "https://testnet.onflow.org")

const doStuff = async () => {
    events = await fcl
        .events("A.43862bd2c9f32864.NFTContract.NFTMinted").subscribe(event => {
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