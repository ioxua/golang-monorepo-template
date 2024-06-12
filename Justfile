# JUSTFILE
# https://github.com/casey/just
#
stage := "dev"
export PATH := justfile_directory() + "/node_modules/.bin:" + env_var('PATH')

default:
    @just --choose

help:
    @just --list

# Project setup
setup:
    @echo '⛳ Begin project setup'
    pnpm install
    just fix
    husky install

# Process recorded changesets
version:
    multi-semantic-release --dry-run

generate projecttype="lib" name="":
    corepack yarn nx generate @nx-go/nx-go:{{projecttype}} {{name}}

# build all the things
build project="affected" *ARGS='':
    corepack yarn nx run-many \
        --target=build \
        --all \
        -- {{ ARGS }}

# lint changed packages
lint project="affected" *ARGS='':
    corepack yarn nx {{project}} \
        --target=lint \
        -- {{ ARGS }}

# test changed packages
test project="affected" *ARGS='':
    corepack yarn nx {{project}} \
    --target=test \
    -- --ci --reporters=default --reporters=jest-junit {{ ARGS }}

# test changed packages
serve project="" config="":
    corepack yarn nx serve {{project}} --configuration={{config}}

# typecheck changed packages
typecheck project="affected":
    corepack yarn nx {{project}} \
    --target=typecheck

# run all pullrequest checks
prcheck: lint test typecheck

# omg reset!
clean:
    git clean -xdf

# fix monorepo issues
tidy:
    @echo "👨‍⚕️ Fixing monorepo problems"
    syncpack format
    syncpack set-semver-ranges

pr-check:
    @echo "👨‍⚕️ Checking PR"
    just tidy
    just lint
    just test
    just typecheck

# nx shortcut
nx *ARGS='':
    @# This exists so we can tell developers:
    @#
    @#   "You only need to remember `just`"
    @#
    @#    $ just this and that
    @#
    nx {{ARGS}}

