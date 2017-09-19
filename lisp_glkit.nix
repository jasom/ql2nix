
{ buildLispPackage, stdenv, fetchurl, lisp-project_glkit, 
   lisp_static-vectors, lisp_cl-opengl, lisp_mathkit, lisp_sb-cga, lisp_defpackage-plus, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_static-vectors lisp_cl-opengl lisp_mathkit lisp_sb-cga lisp_defpackage-plus lisp_alexandria  ];
      inherit stdenv;
      systemName = "glkit";
      
      sourceProject = "${lisp-project_glkit}";
      patches = [];
      lisp_dependencies = "${lisp_static-vectors} ${lisp_cl-opengl} ${lisp_mathkit} ${lisp_sb-cga} ${lisp_defpackage-plus} ${lisp_alexandria}";
      name = "lisp_glkit-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
