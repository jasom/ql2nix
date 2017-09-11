
{ buildLispPackage, stdenv, fetchurl, lisp-project_softdrink, 
   lisp_lquery, lisp_lass,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lquery lisp_lass  ];
      inherit stdenv;
      systemName = "softdrink";
      
      sourceProject = "${lisp-project_softdrink}";
      patches = [];
      lisp_dependencies = "${lisp_lquery} ${lisp_lass}";
      name = "lisp_softdrink-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
