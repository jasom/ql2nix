
{ buildLispPackage, stdenv, fetchurl, lisp-project_closure-html, 
   lisp_closure-common, lisp_flexi-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closure-common lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "closure-html";
      
      sourceProject = "${lisp-project_closure-html}";
      patches = [];
      lisp_dependencies = "${lisp_closure-common} ${lisp_flexi-streams}";
      name = "lisp_closure-html-20140826-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
