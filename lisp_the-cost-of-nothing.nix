
{ buildLispPackage, stdenv, fetchurl, lisp-project_the-cost-of-nothing, 
   lisp_closer-mop, lisp_trivial-garbage, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_trivial-garbage lisp_alexandria  ];
      inherit stdenv;
      systemName = "the-cost-of-nothing";
      
      sourceProject = "${lisp-project_the-cost-of-nothing}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_trivial-garbage} ${lisp_alexandria}";
      name = "lisp_the-cost-of-nothing-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
