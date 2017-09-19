
{ buildLispPackage, stdenv, fetchurl, lisp-project_chtml-matcher, 
   lisp_f-underscore, lisp_stdutils, lisp_closure-html,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_f-underscore lisp_stdutils lisp_closure-html  ];
      inherit stdenv;
      systemName = "chtml-matcher";
      
      sourceProject = "${lisp-project_chtml-matcher}";
      patches = [];
      lisp_dependencies = "${lisp_f-underscore} ${lisp_stdutils} ${lisp_closure-html}";
      name = "lisp_chtml-matcher-20111001-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
