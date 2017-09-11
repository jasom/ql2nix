
{ buildLispPackage, stdenv, fetchurl, lisp-project_quickutil, 
   lisp_cl-fad, lisp_quickutil-client-management, lisp_quickutil-utilities,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_quickutil-client-management lisp_quickutil-utilities  ];
      inherit stdenv;
      systemName = "quickutil-client";
      
      sourceProject = "${lisp-project_quickutil}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_quickutil-client-management} ${lisp_quickutil-utilities}";
      name = "lisp_quickutil-client-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
