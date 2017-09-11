
{ buildLispPackage, stdenv, fetchurl, lisp-project_hash-set, 
   lisp_alexandria, lisp_optima,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_optima  ];
      inherit stdenv;
      systemName = "hash-set";
      
      sourceProject = "${lisp-project_hash-set}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_optima}";
      name = "lisp_hash-set-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
