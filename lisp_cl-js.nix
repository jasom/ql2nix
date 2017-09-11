
{ buildLispPackage, stdenv, fetchurl, lisp-project_js, 
   lisp_cl-ppcre, lisp_local-time, lisp_parse-js,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_local-time lisp_parse-js  ];
      inherit stdenv;
      systemName = "cl-js";
      
      sourceProject = "${lisp-project_js}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_local-time} ${lisp_parse-js}";
      name = "lisp_cl-js-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
