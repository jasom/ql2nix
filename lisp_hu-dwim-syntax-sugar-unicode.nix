
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-syntax-sugar, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-syntax-sugar,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-syntax-sugar  ];
      inherit stdenv;
      systemName = "hu.dwim.syntax-sugar/unicode";
      
      sourceProject = "${lisp-project_hu-dwim-syntax-sugar}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-syntax-sugar}";
      name = "lisp_hu-dwim-syntax-sugar-unicode-20161204-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
