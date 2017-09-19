
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-closure-template, 
   lisp_split-sequence, lisp_closer-mop, lisp_iterate, lisp_esrap, lisp_parse-number, lisp_babel,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_closer-mop lisp_iterate lisp_esrap lisp_parse-number lisp_babel  ];
      inherit stdenv;
      systemName = "closure-template";
      
      sourceProject = "${lisp-project_cl-closure-template}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_closer-mop} ${lisp_iterate} ${lisp_esrap} ${lisp_parse-number} ${lisp_babel}";
      name = "lisp_closure-template-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
