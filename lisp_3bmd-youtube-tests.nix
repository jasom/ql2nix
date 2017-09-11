
{ buildLispPackage, stdenv, fetchurl, lisp-project_3bmd, 
   lisp_3bmd-youtube, lisp_fiasco,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_3bmd-youtube lisp_fiasco  ];
      inherit stdenv;
      systemName = "3bmd-youtube-tests";
      
      sourceProject = "${lisp-project_3bmd}";
      patches = [];
      lisp_dependencies = "${lisp_3bmd-youtube} ${lisp_fiasco}";
      name = "lisp_3bmd-youtube-tests-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
