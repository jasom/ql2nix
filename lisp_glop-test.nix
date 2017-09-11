
{ buildLispPackage, stdenv, fetchurl, lisp-project_glop, 
   lisp_glop, lisp_cl-opengl, lisp_cl-glu,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glop lisp_cl-opengl lisp_cl-glu  ];
      inherit stdenv;
      systemName = "glop-test";
      
      sourceProject = "${lisp-project_glop}";
      patches = [];
      lisp_dependencies = "${lisp_glop} ${lisp_cl-opengl} ${lisp_cl-glu}";
      name = "lisp_glop-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
