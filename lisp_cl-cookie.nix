
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cookie, 
   lisp_local-time, lisp_quri, lisp_cl-ppcre, lisp_proc-parse,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_quri lisp_cl-ppcre lisp_proc-parse  ];
      inherit stdenv;
      systemName = "cl-cookie";
      
      sourceProject = "${lisp-project_cl-cookie}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_quri} ${lisp_cl-ppcre} ${lisp_proc-parse}";
      name = "lisp_cl-cookie-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
