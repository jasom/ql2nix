
{ buildLispPackage, stdenv, fetchurl, lisp-project_http-parse, 
   lisp_cl-ppcre, lisp_babel,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_babel  ];
      inherit stdenv;
      systemName = "http-parse";
      
      sourceProject = "${lisp-project_http-parse}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_babel}";
      name = "lisp_http-parse-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
