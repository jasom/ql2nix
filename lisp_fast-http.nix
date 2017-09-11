
{ buildLispPackage, stdenv, fetchurl, lisp-project_fast-http, 
   lisp_alexandria, lisp_cl-utilities, lisp_proc-parse, lisp_xsubseq, lisp_smart-buffer,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-utilities lisp_proc-parse lisp_xsubseq lisp_smart-buffer  ];
      inherit stdenv;
      systemName = "fast-http";
      
      sourceProject = "${lisp-project_fast-http}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-utilities} ${lisp_proc-parse} ${lisp_xsubseq} ${lisp_smart-buffer}";
      name = "lisp_fast-http-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
