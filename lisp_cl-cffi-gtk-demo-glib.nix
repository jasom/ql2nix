
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
   lisp_cl-cffi-gtk,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cffi-gtk  ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-demo-glib";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cffi-gtk}";
      name = "lisp_cl-cffi-gtk-demo-glib-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
