
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-neo4j, 
   lisp_alexandria, lisp_anaphora, lisp_babel, lisp_cl-json, lisp_cl-ppcre, lisp_drakma, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_babel lisp_cl-json lisp_cl-ppcre lisp_drakma lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-neo4j";
      
      sourceProject = "${lisp-project_cl-neo4j}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_babel} ${lisp_cl-json} ${lisp_cl-ppcre} ${lisp_drakma} ${lisp_split-sequence}";
      name = "lisp_cl-neo4j-release-b8ad637a-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
