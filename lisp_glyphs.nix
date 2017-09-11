
{ buildLispPackage, stdenv, fetchurl, lisp-project_glyphs, 
   lisp_cl-ppcre, lisp_named-readtables, lisp_parenscript,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_named-readtables lisp_parenscript  ];
      inherit stdenv;
      systemName = "glyphs";
      
      sourceProject = "${lisp-project_glyphs}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_named-readtables} ${lisp_parenscript}";
      name = "lisp_glyphs-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
