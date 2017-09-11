
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ascii-art, 
   lisp_cl-ansi-text, lisp_iterate, lisp_inferior-shell, lisp_split-sequence, lisp_cl-ppcre,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ansi-text lisp_iterate lisp_inferior-shell lisp_split-sequence lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-ascii-art";
      
      sourceProject = "${lisp-project_cl-ascii-art}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ansi-text} ${lisp_iterate} ${lisp_inferior-shell} ${lisp_split-sequence} ${lisp_cl-ppcre}";
      name = "lisp_cl-ascii-art-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
