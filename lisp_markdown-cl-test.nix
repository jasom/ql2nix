
{ buildLispPackage, stdenv, fetchurl, lisp-project_markdown-cl, 
   lisp_markdown-cl, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_markdown-cl lisp_fiveam  ];
      inherit stdenv;
      systemName = "markdown.cl-test";
      
      sourceProject = "${lisp-project_markdown-cl}";
      patches = [];
      lisp_dependencies = "${lisp_markdown-cl} ${lisp_fiveam}";
      name = "lisp_markdown-cl-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
