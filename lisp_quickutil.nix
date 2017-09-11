
{ buildLispPackage, stdenv, fetchurl, lisp-project_quickutil, 
   lisp_quickutil-client,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_quickutil-client  ];
      inherit stdenv;
      systemName = "quickutil";
      
      sourceProject = "${lisp-project_quickutil}";
      patches = [];
      lisp_dependencies = "${lisp_quickutil-client}";
      name = "lisp_quickutil-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
