
{ buildLispPackage, stdenv, fetchurl, lisp-project_paren-util, 
   lisp_paren-files,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_paren-files  ];
      inherit stdenv;
      systemName = "paren-util";
      
      sourceProject = "${lisp-project_paren-util}";
      patches = [];
      lisp_dependencies = "${lisp_paren-files}";
      name = "lisp_paren-util-20110418-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
