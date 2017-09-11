
{ buildLispPackage, stdenv, fetchurl, lisp-project_random-access-lists, 
   lisp_lisp-unit,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-unit  ];
      inherit stdenv;
      systemName = "random-access-lists";
      
      sourceProject = "${lisp-project_random-access-lists}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-unit}";
      name = "lisp_random-access-lists-20120208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
