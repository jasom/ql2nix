
{ buildLispPackage, stdenv, fetchurl, lisp-project_esrap-peg, 
   lisp_cl-unification, lisp_iterate, lisp_esrap,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-unification lisp_iterate lisp_esrap  ];
      inherit stdenv;
      systemName = "esrap-peg";
      
      sourceProject = "${lisp-project_esrap-peg}";
      patches = [];
      lisp_dependencies = "${lisp_cl-unification} ${lisp_iterate} ${lisp_esrap}";
      name = "lisp_esrap-peg-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
