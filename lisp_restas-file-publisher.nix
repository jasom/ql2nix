
{ buildLispPackage, stdenv, fetchurl, lisp-project_restas-file-publisher, 
   lisp_restas,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_restas  ];
      inherit stdenv;
      systemName = "restas.file-publisher";
      
      sourceProject = "${lisp-project_restas-file-publisher}";
      patches = [];
      lisp_dependencies = "${lisp_restas}";
      name = "lisp_restas-file-publisher-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
