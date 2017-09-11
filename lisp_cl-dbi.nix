
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-dbi, 
   lisp_dbi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dbi  ];
      inherit stdenv;
      systemName = "cl-dbi";
      
      sourceProject = "${lisp-project_cl-dbi}";
      patches = [];
      lisp_dependencies = "${lisp_dbi}";
      name = "lisp_cl-dbi-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
