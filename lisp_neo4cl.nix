
{ buildLispPackage, stdenv, fetchurl, lisp-project_neo4cl, 
   lisp_cl-ppcre, lisp_drakma, lisp_cl-json,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_drakma lisp_cl-json  ];
      inherit stdenv;
      systemName = "neo4cl";
      
      sourceProject = "${lisp-project_neo4cl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_drakma} ${lisp_cl-json}";
      name = "lisp_neo4cl-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
