
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pixman, 
  xorg,   lisp_trivial-garbage, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_cffi xorg.pixman ];
      inherit stdenv;
      systemName = "pixman";
      
      sourceProject = "${lisp-project_cl-pixman}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_cffi}";
      name = "lisp_pixman-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
