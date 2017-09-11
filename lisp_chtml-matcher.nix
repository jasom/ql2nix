
{ buildLispPackage, stdenv, fetchurl, lisp-project_chtml-matcher, 
   lisp_cl-ppcre, lisp_closure-html, lisp_f-underscore, lisp_stdutils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_closure-html lisp_f-underscore lisp_stdutils  ];
      inherit stdenv;
      systemName = "chtml-matcher";
      
      sourceProject = "${lisp-project_chtml-matcher}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_closure-html} ${lisp_f-underscore} ${lisp_stdutils}";
      name = "lisp_chtml-matcher-20111001-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
