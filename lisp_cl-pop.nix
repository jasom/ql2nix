
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pop, 
   lisp_cl-ppcre, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-pop";
      
      sourceProject = "${lisp-project_cl-pop}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_usocket}";
      name = "lisp_cl-pop-20110418-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
