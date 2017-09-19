
{ buildLispPackage, stdenv, fetchurl, lisp-project_glaw, 
   lisp_cl-alc, lisp_cl-openal, lisp_cl-opengl,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-alc lisp_cl-openal lisp_cl-opengl  ];
      inherit stdenv;
      systemName = "glaw";
      
      sourceProject = "${lisp-project_glaw}";
      patches = [];
      lisp_dependencies = "${lisp_cl-alc} ${lisp_cl-openal} ${lisp_cl-opengl}";
      name = "lisp_glaw-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
