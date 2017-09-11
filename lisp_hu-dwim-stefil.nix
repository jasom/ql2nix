
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-stefil, 
   lisp_alexandria, lisp_hu-dwim-asdf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.stefil";
      
      sourceProject = "${lisp-project_hu-dwim-stefil}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-stefil-20170403-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
