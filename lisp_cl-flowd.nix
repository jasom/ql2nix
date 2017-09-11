
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-flowd, 
   lisp_cl-annot,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-annot  ];
      inherit stdenv;
      systemName = "cl-flowd";
      
      sourceProject = "${lisp-project_cl-flowd}";
      patches = [];
      lisp_dependencies = "${lisp_cl-annot}";
      name = "lisp_cl-flowd-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
