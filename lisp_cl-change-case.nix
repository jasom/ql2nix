
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-change-case, 
   lisp_cl-ppcre-unicode, lisp_cl-ppcre, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre-unicode lisp_cl-ppcre lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-change-case";
      
      sourceProject = "${lisp-project_cl-change-case}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre-unicode} ${lisp_cl-ppcre} ${lisp_alexandria}";
      name = "lisp_cl-change-case-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
