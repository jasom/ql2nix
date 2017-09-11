
{ buildLispPackage, stdenv, fetchurl, lisp-project_gendl, 
   lisp_cl-html-parse, lisp_gwl-graphics,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-html-parse lisp_gwl-graphics  ];
      inherit stdenv;
      systemName = "yadd";
      
      sourceProject = "${lisp-project_gendl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-html-parse} ${lisp_gwl-graphics}";
      name = "lisp_yadd-devo-0272a167-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
