
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ply, 
   lisp_cl-pattern, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-pattern lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-ply";
      
      sourceProject = "${lisp-project_cl-ply}";
      patches = [];
      lisp_dependencies = "${lisp_cl-pattern} ${lisp_cl-ppcre}";
      name = "lisp_cl-ply-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
