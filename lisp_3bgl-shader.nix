
{ buildLispPackage, stdenv, fetchurl, lisp-project_3bgl-shader, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_cl-opengl,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_cl-opengl  ];
      inherit stdenv;
      systemName = "3bgl-shader";
      
      sourceProject = "${lisp-project_3bgl-shader}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_cl-opengl}";
      name = "lisp_3bgl-shader-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
