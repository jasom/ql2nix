
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, lisp-alexandria, lisp-trivial-features, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf lisp-alexandria lisp-trivial-features  ];
      inherit stdenv;
      lisp_name = "sbcl-babel";
      LD_LIBRARY_PATH = "";
      systemName = "babel";
      lisp_dependencies = "${lisp-alexandria} ${lisp-trivial-features}";
      name = "babel-20150608-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/babel/2015-06-08/babel-20150608-git.tgz";
        md5 = "308e6c9132994cf09db7766569ee23fd";
      };
    }
