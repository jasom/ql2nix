
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-closure-template, 
   lisp_alexandria, lisp_babel, lisp_closer-mop, lisp_esrap, lisp_iterate, lisp_parse-number, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel lisp_closer-mop lisp_esrap lisp_iterate lisp_parse-number lisp_split-sequence  ];
      inherit stdenv;
      systemName = "closure-template";
      
      sourceProject = "${lisp-project_cl-closure-template}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel} ${lisp_closer-mop} ${lisp_esrap} ${lisp_iterate} ${lisp_parse-number} ${lisp_split-sequence}";
      name = "lisp_closure-template-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
