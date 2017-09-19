
{ buildLispPackage, stdenv, fetchurl, lisp-project_xhtmlambda, 
   lisp_cl-unicode,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-unicode  ];
      inherit stdenv;
      systemName = "xhtmlambda";
      
      sourceProject = "${lisp-project_xhtmlambda}";
      patches = [];
      lisp_dependencies = "${lisp_cl-unicode}";
      name = "lisp_xhtmlambda-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
