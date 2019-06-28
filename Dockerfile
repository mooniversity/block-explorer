FROM gitpod/workspace-full:latest
USER root

# Install bitcoin
RUN sudo add-apt-repository ppa:bitcoin/bitcoin \
    && sudo apt-get update \
    && sudo apt-get install -yq bitcoind

# Uninstall linters
RUN pip2 uninstall -y pyflakes pipenv pylint rope flake8 autopep8 pep8 pylama pydocstyle bandit \
    && pip3 uninstall -y pyflakes pipenv pylint rope flake8 autopep8 pep8 pylama pydocstyle bandit 

# Update bashrc
RUN echo "export BITCOIN_DATA_DIR='/workspace/bitcoin'" >> $HOME/.bashrc \
    && echo "alias bitcoin-cli='bitcoin-cli -rpcuser=bitcoin -rpcpassword=python -rpcconnect=68.183.110.103'" >> $HOME/.bashrc \
    && echo "alias python='python3'" >> $HOME/.bashrc \
    && echo "alias pip='pip3'" >> $HOME/.bashrc
