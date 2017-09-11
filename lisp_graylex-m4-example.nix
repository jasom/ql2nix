
{ buildLispPackage, stdenv, fetchurl, lisp-project_graylex, 
   lisp_cl-heredoc, lisp_graylex,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-heredoc lisp_graylex  ];
      inherit stdenv;
      systemName = "graylex-m4-example";
      
      sourceProject = "${lisp-project_graylex}";
      patches = [];
      lisp_dependencies = "${lisp_cl-heredoc} ${lisp_graylex}";
      name = "lisp_graylex-m4-example-20110522-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
