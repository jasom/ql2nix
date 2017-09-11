
{ buildLispPackage, stdenv, fetchurl, lisp-project_vertex, 
   lisp_common-doc, lisp_common-doc-plump, lisp_plump-tex,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_common-doc lisp_common-doc-plump lisp_plump-tex  ];
      inherit stdenv;
      systemName = "vertex";
      
      sourceProject = "${lisp-project_vertex}";
      patches = [];
      lisp_dependencies = "${lisp_common-doc} ${lisp_common-doc-plump} ${lisp_plump-tex}";
      name = "lisp_vertex-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
