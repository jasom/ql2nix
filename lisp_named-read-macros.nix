
{ buildLispPackage, stdenv, fetchurl, lisp-project_named-read-macros, 
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
      systemName = "named-read-macros";
      
      sourceProject = "${lisp-project_named-read-macros}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables}";
      name = "lisp_named-read-macros-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
