
{ buildLispPackage, stdenv, fetchurl, lisp-project_babel, 
   lisp_babel, lisp_hu-dwim-stefil,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "babel-tests";
      
      sourceProject = "${lisp-project_babel}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_hu-dwim-stefil}";
      name = "lisp_babel-tests-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
