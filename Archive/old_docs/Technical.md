using this tutorial for basic multiplayer that is p2p: https://www.youtube.com/watch?v=n8D3vEx7NAE
adding noray netfox later

bruh i thought we were doing decetrialized p2p but alr no godot doesnt offer that in their high level bs. uhhh then lets just do client host architecture (90% of godot tutorials lol) with the netfox rollback where the hsot has a veto with later host migration.

# Architecture Decisions
- **Network Topology:** Client-Host (Listen Server) architecture, transitioning to Noray for NAT traversal and Netfox for rollback Netcode. 