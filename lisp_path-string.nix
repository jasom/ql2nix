
{ buildLispPackage, stdenv, fetchurl, lisp-project_path-string, 
   lisp_split-sequence, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "path-string";
      
      sourceProject = "${lisp-project_path-string}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_cl-ppcre}";
      name = "lisp_path-string-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
