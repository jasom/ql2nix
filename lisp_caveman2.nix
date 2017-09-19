
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman, 
   lisp_dbi, lisp_cl-project, lisp_ningle,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dbi lisp_cl-project lisp_ningle  ];
      inherit stdenv;
      systemName = "caveman2";
      
      sourceProject = "${lisp-project_caveman}";
      patches = [];
      lisp_dependencies = "${lisp_dbi} ${lisp_cl-project} ${lisp_ningle}";
      name = "lisp_caveman2-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
