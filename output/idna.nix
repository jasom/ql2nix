
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, lisp-split-sequence, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf lisp-split-sequence  ];
      inherit stdenv;
      lisp_name = "sbcl-idna";
      LD_LIBRARY_PATH = "";
      systemName = "idna";
      lisp_dependencies = "${lisp-split-sequence}";
      name = "idna-20120107-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/idna/2012-01-07/idna-20120107-git.tgz";
        md5 = "85b91a66efe4381bf116cdb5d2b756b6";
      };
    }
