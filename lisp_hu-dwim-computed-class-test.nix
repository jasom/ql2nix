
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-computed-class, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-computed-class-hu-dwim-logger, lisp_hu-dwim-stefil-hu-dwim-def,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-computed-class-hu-dwim-logger lisp_hu-dwim-stefil-hu-dwim-def  ];
      inherit stdenv;
      systemName = "hu.dwim.computed-class.test";
      
      sourceProject = "${lisp-project_hu-dwim-computed-class}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-computed-class-hu-dwim-logger} ${lisp_hu-dwim-stefil-hu-dwim-def}";
      name = "lisp_hu-dwim-computed-class-test-20161204-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
