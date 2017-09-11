
{ buildLispPackage, stdenv, fetchurl, lisp-project_markdown-cl, 
   lisp_cl-ppcre, lisp_xmls, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_xmls lisp_split-sequence  ];
      inherit stdenv;
      systemName = "markdown.cl";
      
      sourceProject = "${lisp-project_markdown-cl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_xmls} ${lisp_split-sequence}";
      name = "lisp_markdown-cl-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
