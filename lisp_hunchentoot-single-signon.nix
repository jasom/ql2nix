
{ buildLispPackage, stdenv, fetchurl, lisp-project_hunchentoot-single-signon, 
   lisp_cl-gss, lisp_hunchentoot,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gss lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "hunchentoot-single-signon";
      
      sourceProject = "${lisp-project_hunchentoot-single-signon}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gss} ${lisp_hunchentoot}";
      name = "lisp_hunchentoot-single-signon-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
