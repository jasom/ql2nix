
{ buildLispPackage, stdenv, fetchurl, lisp-project_esrap-peg, 
   lisp_alexandria, lisp_cl-unification, lisp_esrap, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-unification lisp_esrap lisp_iterate  ];
      inherit stdenv;
      systemName = "esrap-peg";
      
      sourceProject = "${lisp-project_esrap-peg}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-unification} ${lisp_esrap} ${lisp_iterate}";
      name = "lisp_esrap-peg-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
