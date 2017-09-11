
{ buildLispPackage, stdenv, fetchurl, lisp-project_restas-file-publisher, 
   lisp_cl-fad, lisp_restas,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_restas  ];
      inherit stdenv;
      systemName = "restas.file-publisher";
      
      sourceProject = "${lisp-project_restas-file-publisher}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_restas}";
      name = "lisp_restas-file-publisher-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
