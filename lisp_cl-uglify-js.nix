
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-uglify-js, 
   lisp_iterate, lisp_parse-number, lisp_cl-ppcre-unicode, lisp_cl-ppcre, lisp_parse-js,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_parse-number lisp_cl-ppcre-unicode lisp_cl-ppcre lisp_parse-js  ];
      inherit stdenv;
      systemName = "cl-uglify-js";
      
      sourceProject = "${lisp-project_cl-uglify-js}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_parse-number} ${lisp_cl-ppcre-unicode} ${lisp_cl-ppcre} ${lisp_parse-js}";
      name = "lisp_cl-uglify-js-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
