
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mechanize, 
   lisp_cxml-stp, lisp_closure-html, lisp_drakma, lisp_puri,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cxml-stp lisp_closure-html lisp_drakma lisp_puri  ];
      inherit stdenv;
      systemName = "cl-mechanize";
      
      sourceProject = "${lisp-project_cl-mechanize}";
      patches = [];
      lisp_dependencies = "${lisp_cxml-stp} ${lisp_closure-html} ${lisp_drakma} ${lisp_puri}";
      name = "lisp_cl-mechanize-20110219-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
