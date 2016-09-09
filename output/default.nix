{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  helpers = { buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl; };

  callPackage = pkgs.lib.callPackageWith (pkgs // helpers // self);

  self = {
  inherit pkgs;
lisp-alexandria = callPackage ./alexandria.nix { };
lisp-trivial-garbage = callPackage ./trivial-garbage.nix { };

lisp-named-readtables = callPackage ./named-readtables.nix { };

lisp-iterate = callPackage ./iterate.nix { };

lisp-closer-mop = callPackage ./closer-mop.nix { };

lisp-cl-ppcre = callPackage ./cl-ppcre.nix { };

lisp-qt = callPackage ./qt.nix { };



lisp-swap-bytes = callPackage ./swap-bytes.nix { };

lisp-split-sequence = callPackage ./split-sequence.nix { };

lisp-idna = callPackage ./idna.nix { };


    lisp-agm = callPackage ./agm.nix { };

    lisp-babel = callPackage ./babel.nix { };

    lisp-uiop = callPackage ./uiop.nix { };

    lisp-cffi = callPackage ./cffi.nix { };

    lisp-bordeaux-threads = callPackage ./bordeaux-threads.nix { };

    lisp-trivial-features = callPackage ./trivial-features.nix { };

    #gpm = callPackage ./pkgs/gpm { };

    #mc = callPackage ./pkgs/mc { };
  };
in
  self
