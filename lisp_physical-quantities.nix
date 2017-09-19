
{ buildLispPackage, stdenv, fetchurl, lisp-project_physical-quantities, 
   lisp_parseq,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parseq  ];
      inherit stdenv;
      systemName = "physical-quantities";
      
      sourceProject = "${lisp-project_physical-quantities}";
      patches = [];
      lisp_dependencies = "${lisp_parseq}";
      name = "lisp_physical-quantities-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
