
{ buildLispPackage, stdenv, fetchurl, lisp-project_arrow-macros, 
   lisp_hu-dwim-walker,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-walker  ];
      inherit stdenv;
      systemName = "arrow-macros";
      
      sourceProject = "${lisp-project_arrow-macros}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-walker}";
      name = "lisp_arrow-macros-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
