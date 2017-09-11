
{ buildLispPackage, stdenv, fetchurl, lisp-project_quickutil, 
   lisp_cl-heredoc,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-heredoc  ];
      inherit stdenv;
      systemName = "quickutil-utilities";
      
      sourceProject = "${lisp-project_quickutil}";
      patches = [];
      lisp_dependencies = "${lisp_cl-heredoc}";
      name = "lisp_quickutil-utilities-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
