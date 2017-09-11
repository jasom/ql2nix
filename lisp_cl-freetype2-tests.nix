
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-freetype2, 
   lisp_cl-freetype2, lisp_fiveam,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-freetype2 lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-freetype2-tests";
      
      sourceProject = "${lisp-project_cl-freetype2}";
      patches = [];
      lisp_dependencies = "${lisp_cl-freetype2} ${lisp_fiveam}";
      name = "lisp_cl-freetype2-tests-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
