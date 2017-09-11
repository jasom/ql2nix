
{ buildLispPackage, stdenv, fetchurl, lisp-project_make-hash, 
   lisp_fiveam, lisp_make-hash,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_make-hash  ];
      inherit stdenv;
      systemName = "make-hash-tests";
      
      sourceProject = "${lisp-project_make-hash}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_make-hash}";
      name = "lisp_make-hash-tests-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
