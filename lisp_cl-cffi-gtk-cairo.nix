
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
  cairo,   lisp_iterate, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_cffi cairo ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-cairo";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_cffi}";
      name = "lisp_cl-cffi-gtk-cairo-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
