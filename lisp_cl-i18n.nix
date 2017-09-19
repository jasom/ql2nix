
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-i18n, 
   lisp_babel, lisp_cl-ppcre-unicode, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-ppcre-unicode lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-i18n";
      
      sourceProject = "${lisp-project_cl-i18n}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-ppcre-unicode} ${lisp_alexandria}";
      name = "lisp_cl-i18n-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
