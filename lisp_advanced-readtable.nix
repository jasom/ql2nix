
{ buildLispPackage, stdenv, fetchurl, lisp-project_advanced-readtable, 
   lisp_named-readtables,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables  ];
      inherit stdenv;
      systemName = "advanced-readtable";
      
      sourceProject = "${lisp-project_advanced-readtable}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables}";
      name = "lisp_advanced-readtable-20130720-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
