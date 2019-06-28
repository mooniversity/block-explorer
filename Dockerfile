FROM gitpod/workspace-full:latest
USER root

# Install bitcoin
RUN sudo add-apt-repository ppa:bitcoin/bitcoin \
    && sudo apt-get update \
    && sudo apt-get install -yq bitcoind

# Update bashrc
RUN echo "export BITCOIN_DATA_DIR='/workspace/bitcoin'" >> $HOME/.bashrc \
    && echo "alias testnet='bitcoin-cli -testnet -datadir=/workspace/bitcoin -rpcuser=bitcoin -rpcpassword=python' -rpcconnect=68.183.110.103" >> $HOME/.bashrc \
    && echo "alias mainnet='bitcoin-cli -rpcuser=bitcoin -rpcpassword=python -rpcconnect=68.183.110.103'" >> $HOME/.bashrc \
    && echo "alias python='python3'" >> $HOME/.bashrc \
    && echo "alias pip='pip3'" >> $HOME/.bashrc
