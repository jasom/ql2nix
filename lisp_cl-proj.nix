
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-proj, 
  proj,   lisp_parse-number, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-number lisp_cffi proj ];
      inherit stdenv;
      systemName = "cl-proj";
      
      sourceProject = "${lisp-project_cl-proj}";
      patches = [];
      lisp_dependencies = "${lisp_parse-number} ${lisp_cffi}";
      name = "lisp_cl-proj-20150804-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
