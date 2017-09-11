
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-xkb, 
   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi  ];
      inherit stdenv;
      systemName = "cl-xkb";
      
      sourceProject = "${lisp-project_cl-xkb}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-xkb-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
