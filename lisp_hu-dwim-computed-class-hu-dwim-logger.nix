
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-computed-class, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-computed-class, lisp_hu-dwim-logger,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-computed-class lisp_hu-dwim-logger  ];
      inherit stdenv;
      systemName = "hu.dwim.computed-class+hu.dwim.logger";
      
      sourceProject = "${lisp-project_hu-dwim-computed-class}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-computed-class} ${lisp_hu-dwim-logger}";
      name = "lisp_hu-dwim-computed-class-hu-dwim-logger-20161204-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
