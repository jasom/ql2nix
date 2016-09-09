
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, lisp-alexandria, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf lisp-alexandria  ];
      inherit stdenv;
      lisp_name = "sbcl-bordeaux-threads";
      LD_LIBRARY_PATH = "";
      systemName = "bordeaux-threads";
      lisp_dependencies = "${lisp-alexandria}";
      name = "bordeaux-threads-v0.8.5";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bordeaux-threads/2016-03-18/bordeaux-threads-v0.8.5.tgz";
        md5 = "67e363a363e164b6f61a047957b8554e";
      };
    }
