
{ buildLispPackage, stdenv, fetchurl, lisp-project_the-cost-of-nothing, 
   lisp_alexandria, lisp_trivial-garbage, lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_trivial-garbage lisp_closer-mop  ];
      inherit stdenv;
      systemName = "the-cost-of-nothing";
      
      sourceProject = "${lisp-project_the-cost-of-nothing}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_trivial-garbage} ${lisp_closer-mop}";
      name = "lisp_the-cost-of-nothing-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
