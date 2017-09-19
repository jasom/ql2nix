
{ buildLispPackage, stdenv, fetchurl, lisp-project_markdown-cl, 
   lisp_split-sequence, lisp_xmls, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_xmls lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "markdown.cl";
      
      sourceProject = "${lisp-project_markdown-cl}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_xmls} ${lisp_cl-ppcre}";
      name = "lisp_markdown-cl-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
