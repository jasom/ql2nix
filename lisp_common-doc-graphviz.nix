
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-doc, 
   lisp_common-doc, lisp_trivial-shell,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_common-doc lisp_trivial-shell  ];
      inherit stdenv;
      systemName = "common-doc-graphviz";
      
      sourceProject = "${lisp-project_common-doc}";
      patches = [];
      lisp_dependencies = "${lisp_common-doc} ${lisp_trivial-shell}";
      name = "lisp_common-doc-graphviz-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
