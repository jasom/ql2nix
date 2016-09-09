
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, lisp-alexandria, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf lisp-alexandria  ];
      inherit stdenv;
      lisp_name = "sbcl-agm";
      LD_LIBRARY_PATH = "";
      systemName = "agm";
      lisp_dependencies = "${lisp-alexandria}";
      name = "agm-20160825-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/agm/2016-08-25/agm-20160825-git.tgz";
        md5 = "32709f08d094f3a6f918f6f95462f5bf";
      };
    }