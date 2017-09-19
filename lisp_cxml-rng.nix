
{ buildLispPackage, stdenv, fetchurl, lisp-project_cxml-rng, 
   lisp_cl-base64, lisp_parse-number, lisp_yacc, lisp_cl-ppcre, lisp_cxml,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_parse-number lisp_yacc lisp_cl-ppcre lisp_cxml  ];
      inherit stdenv;
      systemName = "cxml-rng";
      
      sourceProject = "${lisp-project_cxml-rng}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_parse-number} ${lisp_yacc} ${lisp_cl-ppcre} ${lisp_cxml}";
      name = "lisp_cxml-rng-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
