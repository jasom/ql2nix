
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_cl-ppcre, lisp_clml-hjs,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_clml-hjs  ];
      inherit stdenv;
      systemName = "clml.data.r-datasets";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_clml-hjs}";
      name = "lisp_clml-data-r-datasets-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
