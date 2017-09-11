
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-graph, 
   lisp_metatilities-base, lisp_cl-containers, lisp_metabang-bind,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metatilities-base lisp_cl-containers lisp_metabang-bind  ];
      inherit stdenv;
      systemName = "cl-graph";
      
      sourceProject = "${lisp-project_cl-graph}";
      patches = [];
      lisp_dependencies = "${lisp_metatilities-base} ${lisp_cl-containers} ${lisp_metabang-bind}";
      name = "lisp_cl-graph-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
