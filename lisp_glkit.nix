
{ buildLispPackage, stdenv, fetchurl, lisp-project_glkit, 
   lisp_alexandria, lisp_cl-opengl, lisp_defpackage-plus, lisp_mathkit, lisp_static-vectors,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-opengl lisp_defpackage-plus lisp_mathkit lisp_static-vectors  ];
      inherit stdenv;
      systemName = "glkit";
      
      sourceProject = "${lisp-project_glkit}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-opengl} ${lisp_defpackage-plus} ${lisp_mathkit} ${lisp_static-vectors}";
      name = "lisp_glkit-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
