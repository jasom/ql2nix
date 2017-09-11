
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-stefil, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-stefil,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "hu.dwim.stefil/test";
      
      sourceProject = "${lisp-project_hu-dwim-stefil}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-stefil}";
      name = "lisp_hu-dwim-stefil-test-20170403-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
