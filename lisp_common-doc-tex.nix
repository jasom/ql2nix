
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-doc, 
   lisp_common-doc,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_common-doc  ];
      inherit stdenv;
      systemName = "common-doc-tex";
      
      sourceProject = "${lisp-project_common-doc}";
      patches = [];
      lisp_dependencies = "${lisp_common-doc}";
      name = "lisp_common-doc-tex-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
