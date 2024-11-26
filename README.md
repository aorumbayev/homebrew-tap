# homebrew-core

## How do I install these formulae?

`brew install algorandfoundation/tap/<formula>`

Or `brew tap algorandfoundation/tap` and then `brew install <formula>`.

## Algokit

To install algokit: `brew install algorandfoundation/tap/algokit`

## The Algorand Node Binaries

To install the Algorand Node Binary (Algod): `brew install algorandfoundation/tap/algorand`

This repository checks the go-algorand repository upstreams twice a day for any new node releases.

The algod node command can be reached by:

```bash
  $(brew --prefix algorand)/bin/algod
```

(If you've properly set the Homebrew environment variables, `algod` is enough.)

You can run it and point it to a data directory with the `-d` flag. A data directory is a directory containing a genesis.json file.

You can find a list of them [here](https://github.com/algorand/go-algorand/tree/db7f1627e4919b05aef5392504e48b93a90a0146/installer/genesis).

To run mainnet:

```bash
  mkdir -p ~/.algorand
  curl -o ~/.algorand/genesis.json https://raw.githubusercontent.com/algorand/go-algorand/ce9b2b0870043ef9d89be9ccf5cda0c42e3af70c/installer/genesis/mainnet/genesis.json
```

You can then run algod with the following command:

```bash
    $(brew --prefix algorand)/bin/algod -d ~/.algorand
```

The data directory at `~/.algorand` will be populated with the relevant files, including the sqllite database files and the algod.admin.token file.

Note that if you choose to upgrade (`brew upgrade algorand`) or uninstall (`brew uninstall algorand`) in the future, this data directory will still be preserved. You will have to manually remove it.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
