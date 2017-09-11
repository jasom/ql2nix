
{ buildLispPackage, stdenv, fetchurl, lisp-project_hunchentoot-single-signon, 
   lisp_cl-base64, lisp_cl-gss, lisp_hunchentoot, lisp_split-sequence,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_cl-gss lisp_hunchentoot lisp_split-sequence  ];
      inherit stdenv;
      systemName = "hunchentoot-single-signon";
      
      sourceProject = "${lisp-project_hunchentoot-single-signon}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_cl-gss} ${lisp_hunchentoot} ${lisp_split-sequence}";
      name = "lisp_hunchentoot-single-signon-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
