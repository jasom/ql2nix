
{ buildLispPackage, stdenv, fetchurl, lisp-project_data-sift, 
   lisp_puri, lisp_alexandria, lisp_parse-number, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_puri lisp_alexandria lisp_parse-number lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "data-sift";
      
      sourceProject = "${lisp-project_data-sift}";
      patches = [];
      lisp_dependencies = "${lisp_puri} ${lisp_alexandria} ${lisp_parse-number} ${lisp_cl-ppcre}";
      name = "lisp_data-sift-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
