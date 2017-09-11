
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rfc2047, 
   lisp_cl-ppcre, lisp_cl-rfc2047, lisp_lift,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cl-rfc2047 lisp_lift  ];
      inherit stdenv;
      systemName = "cl-rfc2047-test";
      
      sourceProject = "${lisp-project_cl-rfc2047}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cl-rfc2047} ${lisp_lift}";
      name = "lisp_cl-rfc2047-test-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
