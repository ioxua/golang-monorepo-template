# GoMonorepoNX

A Golang monorepo using nx.dev

- apps are in `apps`
- packages are in `packages`
- build artifacts are in `dist/`

## Setup

1. Clone repo
2. Enable [corepack][corepack]
3. `./setup.sh` (this installs [asdf](https://asdf-vm.com/) and any plugins in `.tool-versions`, then installs the described tools)
4. `just help`

## Changes

Multiple changes have been implemented when comparing
this repo to the original:

1. GH Actions were updated to their most recent versions;
2. NX dependencies were also updated;
3. Multiple tools were replaced:
   - `asdf` -> `mise` (optional)
   - `yarn` -> `corepack yarn` (optional)
   - `prettier` -> REMOVED?
   - `./setup.sh` -> REMOVED!

# Usage

```shell
$ just help
```

# Development

1. get setup ☝️
2. add nodejs deps only to root `package.json`
3. add go deps to individual `go.mod`
4. run `just pr-check`

## Running Apps

```shell
$ just serve app-one
```

## Generating Apps

```shell
$ just generate app mynewappname
```

## Generating Packages

```shell
$ just generate lib mynewlibname
```

## Nx

```shell
$ just nx ...
```

## Other NX commands

You're free to execute nx commands directly `./node_modules/nx ...`

[corepack]: https://nodejs.org/api/corepack.html
