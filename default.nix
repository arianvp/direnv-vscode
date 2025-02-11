let
  lock = builtins.fromJSON (builtins.readFile ./flake.lock);
  locked = lock.nodes.flake-compat.locked;
  flake-compat = fetchTarball {
    url = "https://github.com/edolstra/flake-compat/archive/${locked.rev}.tar.gz";
    sha256 = locked.narHash;
  };
  flake = import flake-compat {
    src = ./.;
  };
in
  flake.defaultNix
