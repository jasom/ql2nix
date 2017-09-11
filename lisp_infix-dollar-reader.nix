
{ buildLispPackage, stdenv, fetchurl, lisp-project_infix-dollar-reader, 
   lisp_cl-syntax,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax  ];
      inherit stdenv;
      systemName = "infix-dollar-reader";
      
      sourceProject = "${lisp-project_infix-dollar-reader}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax}";
      name = "lisp_infix-dollar-reader-20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
