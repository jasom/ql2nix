
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cookie, 
   lisp_alexandria, lisp_cl-ppcre, lisp_local-time, lisp_proc-parse, lisp_quri,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_local-time lisp_proc-parse lisp_quri  ];
      inherit stdenv;
      systemName = "cl-cookie";
      
      sourceProject = "${lisp-project_cl-cookie}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_local-time} ${lisp_proc-parse} ${lisp_quri}";
      name = "lisp_cl-cookie-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
