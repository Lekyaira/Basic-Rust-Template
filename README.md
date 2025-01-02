# Basic Rust Template
A basic Rust template using Nix.

## Setup
Clone the repo and run either
```
nix-shell
```
for the shell environment or 

```echo "use nix" > .envrc```

if using `direnv`

Then run:

```cargo init```

This will set up the basic Rust Hello app. Just edit your code from there!

## Utilities
Nix specific utilities and development helpers can be found in `.nix/`.
Programs added to `.nix/bin` are in the PATH.

Other utilities can be added here, such as local database implementations, etc..
`run` and `build` are currently included for convenience.
