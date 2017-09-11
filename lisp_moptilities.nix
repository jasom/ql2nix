
{ buildLispPackage, stdenv, fetchurl, lisp-project_moptilities, 
   lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop  ];
      inherit stdenv;
      systemName = "moptilities";
      
      sourceProject = "${lisp-project_moptilities}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop}";
      name = "lisp_moptilities-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
