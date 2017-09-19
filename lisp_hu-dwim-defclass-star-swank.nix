
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-defclass-star, 
   lisp_swank, lisp_hu-dwim-asdf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swank lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.defclass-star+swank";
      
      sourceProject = "${lisp-project_hu-dwim-defclass-star}";
      patches = [];
      lisp_dependencies = "${lisp_swank} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-defclass-star-swank-20150709-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
