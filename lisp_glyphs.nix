
{ buildLispPackage, stdenv, fetchurl, lisp-project_glyphs, 
   lisp_parenscript, lisp_cl-ppcre,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parenscript lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "glyphs";
      
      sourceProject = "${lisp-project_glyphs}";
      patches = [];
      lisp_dependencies = "${lisp_parenscript} ${lisp_cl-ppcre}";
      name = "lisp_glyphs-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
