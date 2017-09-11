
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-netstrings, 
   lisp_arnesi, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_arnesi lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-netstrings";
      
      sourceProject = "${lisp-project_cl-netstrings}";
      patches = [];
      lisp_dependencies = "${lisp_arnesi} ${lisp_iterate}";
      name = "lisp_cl-netstrings-20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
