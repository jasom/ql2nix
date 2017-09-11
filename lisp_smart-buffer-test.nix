
{ buildLispPackage, stdenv, fetchurl, lisp-project_smart-buffer, 
   lisp_babel, lisp_prove, lisp_prove-asdf, lisp_smart-buffer,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_prove lisp_prove-asdf lisp_smart-buffer  ];
      inherit stdenv;
      systemName = "smart-buffer-test";
      
      sourceProject = "${lisp-project_smart-buffer}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_prove} ${lisp_prove-asdf} ${lisp_smart-buffer}";
      name = "lisp_smart-buffer-test-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
