
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-neo4j, 
   lisp_cl-json, lisp_drakma, lisp_split-sequence, lisp_anaphora, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_drakma lisp_split-sequence lisp_anaphora lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-neo4j";
      
      sourceProject = "${lisp-project_cl-neo4j}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_drakma} ${lisp_split-sequence} ${lisp_anaphora} ${lisp_alexandria}";
      name = "lisp_cl-neo4j-release-b8ad637a-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
