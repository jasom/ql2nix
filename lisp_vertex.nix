
{ buildLispPackage, stdenv, fetchurl, lisp-project_vertex, 
   lisp_plump-tex, lisp_common-doc-plump, lisp_common-doc,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_plump-tex lisp_common-doc-plump lisp_common-doc  ];
      inherit stdenv;
      systemName = "vertex";
      
      sourceProject = "${lisp-project_vertex}";
      patches = [];
      lisp_dependencies = "${lisp_plump-tex} ${lisp_common-doc-plump} ${lisp_common-doc}";
      name = "lisp_vertex-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
