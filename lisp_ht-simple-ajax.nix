
{ buildLispPackage, stdenv, fetchurl, lisp-project_ht-simple-ajax, 
   lisp_hunchentoot,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "ht-simple-ajax";
      
      sourceProject = "${lisp-project_ht-simple-ajax}";
      patches = [];
      lisp_dependencies = "${lisp_hunchentoot}";
      name = "lisp_ht-simple-ajax-20130421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
