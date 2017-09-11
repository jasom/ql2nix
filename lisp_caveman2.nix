
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman, 
   lisp_ningle, lisp_cl-project, lisp_dbi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ningle lisp_cl-project lisp_dbi  ];
      inherit stdenv;
      systemName = "caveman2";
      
      sourceProject = "${lisp-project_caveman}";
      patches = [];
      lisp_dependencies = "${lisp_ningle} ${lisp_cl-project} ${lisp_dbi}";
      name = "lisp_caveman2-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
