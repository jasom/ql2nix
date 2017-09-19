
{ buildLispPackage, stdenv, fetchurl, lisp-project_caramel, 
   lisp_css-selectors, lisp_closure-html, lisp_iterate, lisp_cxml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_css-selectors lisp_closure-html lisp_iterate lisp_cxml  ];
      inherit stdenv;
      systemName = "caramel";
      
      sourceProject = "${lisp-project_caramel}";
      patches = [];
      lisp_dependencies = "${lisp_css-selectors} ${lisp_closure-html} ${lisp_iterate} ${lisp_cxml}";
      name = "lisp_caramel-20130420-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
