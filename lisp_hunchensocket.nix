
{ buildLispPackage, stdenv, fetchurl, lisp-project_hunchensocket, 
   lisp_trivial-utf-8, lisp_ironclad, lisp_hunchentoot,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-utf-8 lisp_ironclad lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "hunchensocket";
      
      sourceProject = "${lisp-project_hunchensocket}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-utf-8} ${lisp_ironclad} ${lisp_hunchentoot}";
      name = "lisp_hunchensocket-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
