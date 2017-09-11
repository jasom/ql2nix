
{ buildLispPackage, stdenv, fetchurl, lisp-project_hash-set, 
   lisp_fiveam, lisp_hash-set,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_hash-set  ];
      inherit stdenv;
      systemName = "hash-set-tests";
      
      sourceProject = "${lisp-project_hash-set}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_hash-set}";
      name = "lisp_hash-set-tests-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
