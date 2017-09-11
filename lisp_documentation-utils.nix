
{ buildLispPackage, stdenv, fetchurl, lisp-project_documentation-utils, 
   lisp_trivial-indent,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-indent  ];
      inherit stdenv;
      systemName = "documentation-utils";
      
      sourceProject = "${lisp-project_documentation-utils}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-indent}";
      name = "lisp_documentation-utils-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
