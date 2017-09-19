
{ buildLispPackage, stdenv, fetchurl, lisp-project_xuriella, 
   lisp_split-sequence, lisp_closure-html, lisp_cxml-stp, lisp_cxml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_closure-html lisp_cxml-stp lisp_cxml  ];
      inherit stdenv;
      systemName = "xuriella";
      
      sourceProject = "${lisp-project_xuriella}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_closure-html} ${lisp_cxml-stp} ${lisp_cxml}";
      name = "lisp_xuriella-20120305-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
