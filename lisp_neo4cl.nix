
{ buildLispPackage, stdenv, fetchurl, lisp-project_neo4cl, 
   lisp_cl-json, lisp_drakma, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_drakma lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "neo4cl";
      
      sourceProject = "${lisp-project_neo4cl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_drakma} ${lisp_cl-ppcre}";
      name = "lisp_neo4cl-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
