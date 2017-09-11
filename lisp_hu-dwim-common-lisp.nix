
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-common-lisp, 
   lisp_hu-dwim-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.common-lisp";
      
      sourceProject = "${lisp-project_hu-dwim-common-lisp}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-common-lisp-20150709-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
